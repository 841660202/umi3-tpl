/*
 * @version: v0.0.1
 * @Author: hailong.chen <chenhailong@fr-inc.cn>
 * @Date: Mon Apr 27 2020 10:25:58 GMT+0800 (China Standard Time)
 * @LastEditors: hailong.chen
 * @Description: 用于生成页面的配置信息
 */
const codeGenConf={
  "datapath": "/codeGen/data.config.js", // 产出页面路径，请替换
  "outDir": "/src/pages", // 产出页面路径，请替换
  "tplpath": "/codeGen/hooks", // 自定义模版路径
  "codeType": "react", // 自定义模版路径
  "suffix": "ts",
}
module.exports = codeGenConf
