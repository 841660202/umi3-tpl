/*
 * @version: v0.0.1
 * @Author: {{{author}}}
 * @Date: {{gmtTime}}
 * @LastEditors: hailong.chen
 * @Description: 用于生成页面的配置信息 test001-cli
 */
const config = {
  'path': 'bank/base', // 产出页面路径，请替换
  'type': 'page', // 页面类型（暂未使用），请替换
  'apiPath': 'page....', // 页面类型（暂未使用），请替换
  'title': '工线具管理', // 页面标题，请替换
  // "statistic": [],// 页面统计部分，请替换
  // "attributes": [ // 页面字段，请替换
  //   { key: 'typeNumber', type: 'string', annotation: '产品种类' },
  //   { key: 'totalNumber', type: 'number', annotation: '数量' },
  //   { key: 'totalMoney', type: 'number', annotation: '金额' },
  //   { key: 'productId', type: 'string', annotation: '产品id' },
  //   { key: 'productCode', type: 'string', annotation: '产品编号' },
  //   { key: 'productName', type: 'string', annotation: '产品名称' },
  //   { key: 'price', type: 'number', annotation: '产品单价' },
  //   { key: 'specification', type: 'string', annotation: '产品规格' },
  //   { key: 'number', type: 'number', annotation: '入库数量' },
  //   { key: 'money', type: 'number', annotation: '金额' },
  //   { key: 'unit', type: 'string', annotation: '产品单位' },
  //   { key: 'produceDate', type: 'string', annotation: '生产日期' },
  //   { key: 'lot', type: 'string', annotation: '产品批号' },
  //   { key: 'invalidDate', type: 'string', annotation: '失效日期' },
  //   { key: 'manufacturer', type: 'string', annotation: '生产厂家' },
  //   { key: 'gtin', type: 'string', annotation: '主码' },
  //   { key: 'gtinSub', type: 'string', annotation: '副码' },
  //   { key: 'sourceType', type: 'number', annotation: "库存来源" },
  //   { key: 'in_no', type: 'string', annotation: '入库单号' },
  //   { key: 'supplierName', type: 'string', annotation: '供应商' }
  // ]
  'attributes': [
    { 'key': 'brand', 'type': 'string', 'annotation': '品牌', 'formtext': true }, {
      'key': 'createdBy',
      'type': 'string',
      'annotation': '操作人',
      'formtext': true,
    },
    { 'key': 'desc', 'type': 'string', 'annotation': '工具说明', 'formtext': true }, {
      'key': 'inNo',
      'type': 'string',
      'annotation': '入库单号',
      'formtext': true,
    }, { 'key': 'inTime', 'type': 'string', 'annotation': '入库时间', 'formtext': true }, {
      'key': 'manufacturer',
      'type': 'string',
      'annotation': '生产厂家',
      'formtext': true,
    }
  ]
};
module.exports = config;
