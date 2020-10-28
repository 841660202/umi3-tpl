import { extend } from 'umi-request';
import { notification } from 'antd';
import { getServerType, goSSOLogin } from '@/utils/util';

interface ResponseError<D = any> extends Error {
  name: string;
  data: D;
  response: Response;
}

const codeMessage: any = {
  "200": '服务器成功返回请求的数据。',
  "201": '新建或修改数据成功。',
  "202": '一个请求已经进入后台排队（异步任务）。',
  "204": '删除数据成功。',
  "400": '发出的请求有错误，服务器没有进行新建或修改数据的操作。',
  "401": '用户没有权限（令牌、用户名、密码错误）。',
  "403": '用户得到授权，但是访问是被禁止的。',
  "404": '发出的请求针对的是不存在的记录，服务器没有进行操作。',
  "406": '请求的格式不可得。',
  "410": '请求的资源被永久删除，且不会再得到的。',
  "422": '当创建一个对象时，发生一个验证错误。',
  "500": '服务器发生错误，请检查服务器。',
  "502": '网关错误。',
  "503": '服务不可用，服务器暂时过载或维护。',
  "504": '网关超时。',
};

/**
 * 异常处理程序
 */
const errorHandler = (error: ResponseError) => {
  const { response = {} as Response } = error;
  console.log(error)
  const errorText = codeMessage[response.status] || response.statusText;
  const { status } = response;

  notification.error({
    // message: `请求错误 ${status}: ${url}`,
    message: `请求错误 ${status}`,
    description: errorText,
  });
  return response;
};

const request = extend({
  errorHandler, // 默认错误处理
  credentials: 'include', // 默认请求是否带上cookie
});

request.interceptors.request.use((url, options) => {
  console.log(url)
  const sendOptions = {
    ...options,
    headers: { },
  };
  console.log(sendOptions)
  if (
    options &&
    options.method &&
    options.method.toLocaleLowerCase() === 'post'
  ) {
    // @ts-ignore 上传不做处理
    if (!options.isUpload) {
      sendOptions.data = options.params;
      delete sendOptions.params;
    }
  }
  return {
    url: url.includes('sso')
      ? `${url}`
      : `${url}`,
    options: { ...sendOptions, interceptors: true },
  };
});

// @ts-ignore
request.interceptors.response.use(async response => {
  try {
    const data = (await response.clone().json()) || {};
    if (data && data.returnCode === 'X0110009') {
      goSSOLogin();
      return;
    }
    if (data && data.returnCode !== '000000' && data.returnMessage) {
      notification.error({
        message: data.returnMessage,
      });
    }
  } catch (error) {
    console.log('catch error:', error);
  }
  return response;
});

export default request;
