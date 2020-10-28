export default {
  mock: {
    '/api/': {
      target: 'http://localhost: 3001',
      changeOrigin: true,
      pathRewrite: { '^': '' },
    },
  },
  // 开发
  dev: {
    '/api/': {
      target: 'http://localhost: 3001',
      changeOrigin: true,
      pathRewrite: { '^': '' },
    },
  },
  // 测试
  test: {
    '/api/': {
      target: 'http://localhost: 3001',
      changeOrigin: true,
      pathRewrite: { '^': '' },
    },
  },
  // 预发
  pre: {
    '/api/': {
      target: 'http://localhost: 3001',
      changeOrigin: true,
      pathRewrite: { '^': '' },
    },
  },
  // 生产
  pro: {
    '/api/': {
      target: 'http://localhost: 3001',
      changeOrigin: true,
      pathRewrite: { '^': '' },
    },
  },
};
