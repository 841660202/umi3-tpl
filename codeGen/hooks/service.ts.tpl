/*
 * @version: v0.0.1
 * @Author: %={author}=%
 * @Date: %=gmtTime=%
 * @LastEditors: %={author}=%
 * @Description: %=title=%-service
 */
import request from '@/utils/request';

// 保存
export async function fetchSave(params: any) {
  return request('/%={apiPath}=%/save', {
    method: 'POST',
    params,
  });
}
// 删除
export async function fetchDelete(params: any) {
  return request('/%={apiPath}=%/delete', {
    method: 'POST',
    params,
  });
}
// 列表
export async function fetchList(params: any) {
  return request('/%={apiPath}=%/list', {
    method: 'GET',
    params,
  });
}
// 详情
export async function fetchDetail(params: any) {
  return request('/%={apiPath}=%/statistic', {
    method: 'GET',
    params,
  });
}
