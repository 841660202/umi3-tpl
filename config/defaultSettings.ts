// @ts-ignore
import { Settings as LayoutSettings } from '@ant-design/pro-layout';
// @ts-ignore
import pjson from '../package.json'
export default {
  navTheme: 'dark',
  primaryColor: '#1890ff',
  layout: 'mix',
  contentWidth: 'Fluid',
  fixedHeader: false,
  fixSiderbar: true,
  colorWeak: false,
  menu: {
    locale: false,
  },
  title: pjson.projectName,
  pwa: false,
  logo: '/logo.png',
  iconfontUrl: '',
} as LayoutSettings & {
  pwa: boolean;
};
