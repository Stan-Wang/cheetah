/**
 * 项目配置参数聚合
 */

//软件版本
const {version}=require('../../../package.json')

//获取当前环境host
let host = document.location.protocol + '//' + document.location.hostname

module.exports = {
  name: '管理系统',
  prefix: 'ERP',
  description: '致力于打造最易于使用的管理系统',
  footerText: `Stan 版权所有 © 2017 由 Stan 支持 版本:${version}`,
  logoSrc: '/favicon.png',
  logoText: '管理系统',
  baseURL: host + ':8000/api/v1/',
  BACKEND_BASE: host + ':3000',
  get CORS() {
    return [this.BACKEND_BASE + '/api/v1']
  },
  get UPLOAD_FILE_BASE_URL() {
    return this.BACKEND_BASE + '/api/v1'
  },
  DEV_ROOT_WEB_SITE: [host + ':8000/#/admin'],
  ROOT_WEB_SITE: [host + '/#/admin'],
  API_V1:'/api/v1/'
}
