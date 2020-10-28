export type IActionType =
  | 'isAdd'
  | 'isEdit'
  | 'isUpload'
  | 'isDrawer'
  | 'isPrint'
  | 'isDetail'
  | 'isCheck'
  | 'isReject';

export interface ICommonType {
  data?: any[];
  query?: any;
  loading?: boolean;
  actionType?: IActionType;
  visible?: boolean;
  selectedRowKeys?: string[];
  total?: number;
  currentPage?: number;
  pageSize?: number;
  simpleSearch: boolean;
}
