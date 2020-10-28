import { defineConfig } from 'umi';
import defaultSettings from './defaultSettings';
import proxy from './proxy';
import routes from './config.routes';

const { UMI_ENV } = process.env;
export default defineConfig({
  hash: true,
  antd: {},
  dva: {
    hmr: true,
  },
  favicon: '/favicon1.ico',
  layout: {
    name: 'Ant Design Pro',
    ...defaultSettings,
  },
  locale: {
    default: 'zh-CN',
    antd: false,
    baseNavigator: false,
  },
  dynamicImport: {
    loading: '@/components/PageLoading/index',
  },
  targets: {
    ie: 11,
  },
  routes,
  theme: {
    'primary-color': defaultSettings.primaryColor,
  },
  title: false,
  ignoreMomentLocale: true,
  // @ts-ignore
  proxy: proxy[UMI_ENV || 'dev'],
  manifest: {
    basePath: '/',
  },
});
