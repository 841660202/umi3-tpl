import { notification } from 'antd';
const PKG_JSON = require('../../package.json');
// 端口越界错误提示信息
export function serverUrlErrorTip(port: string) {
  if (!['3000', '3001', '3002', '3003', '3004'].includes(port)) {
    notification.error({
      message: '此提示仅开发环境显示',
      description: '端口有误: 查看README.md 开发调试',
    });
  }
}

// 返回服务器类型
export function getServerType() {
  // 生产环境
  let serverType = `/api`;
  // 开发环境
  if (process.env.NODE_ENV === 'development') {
    const { port } = window.location;
    // 本地环境、开发开发、测试环境
    serverUrlErrorTip(port);
    serverType = `${PKG_JSON.serverType[port]}`;
  }
  return serverType;
}

// 返回服务器下载地址
export function getServerPath() {
  // 生产环境
  let serverPath = `${window.origin}/api`;
  // 开发环境
  if (process.env.NODE_ENV === 'development') {
    serverPath = `${window.origin}${getServerType()}`;
  }
  return serverPath;
}

/**
 * 获取sso的hostname
 */
export function getSSOHost() {
  let hostname;
  if (process.env.NODE_ENV === 'development') {
    switch (window.location.port) {
      case '3003':
        hostname = 'login-dev.weimeng-hosp.com/';
        break;
      case '3004':
        hostname = 'login-test.weimeng-hosp.com/';
        break;
      default:
        notification.error({
          message: '此提示仅开发环境显示',
          description: '端口有误: 查看README.md 开发调试',
        });
        console.log('你或许使用了localSelf配置');
    }
  } else {
    hostname = location.hostname.replace('3pb', 'login');
  }
  return {
    hostname,
    protocol: window.location.protocol,
  };
}

/**
 * 跳转sso的登录地址
 */
export function goSSOLogin() {
  const { hostname, protocol } = getSSOHost();
  const winLocation = `${protocol}//${hostname}?redirectUrl=${location.origin}`;
  (window as any).location = winLocation;
}