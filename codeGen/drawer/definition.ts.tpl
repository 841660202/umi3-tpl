import { Effect } from 'dva';
import { Reducer } from 'redux';
import { ICommonType } from '@/commonType';

export interface %=typeName=% {
  %=#attributes=%
  %=key=%?:%=type=%; //%=annotation=%
  %=/attributes=%
}

export interface  %=typeName=%State extends ICommonType {
  currentItem: %=typeName=%;
  data: %=typeName=%[];
}

type IReducer = Partial<%=typeName=%State>

export interface %=typeName=%ModelType {
  namespace: '%=nameSpace=%';
  state: %=typeName=%State;
  effects: {
    save?: Effect;       // 添加 or 修改
    del?: Effect;        // 删除
    getDetail?: Effect;  // 获取详情
    loadList?: Effect;   // 加载列表
  };
  reducers: {
    initQuery?: Reducer<IReducer>; // 重置查询条件
    updateQuery?: Reducer<IReducer>; // 更改查询条件
    updateSimpleSearch?: Reducer<IReducer>; // 切换简单/高级查询
    updateList?: Reducer<IReducer>; // 更改列表
    updateSelectedRowKeys?: Reducer<IReducer>; // 列表项多选
    updatePageIndex?: Reducer<IReducer>; // 更改页码
    updatePageSize?: Reducer<IReducer>; // 更改页展示条数
    updateLoading?: Reducer<IReducer>; // 更改loading 状态
    updateCurrentItem?: Reducer<IReducer>; // 当前选中列表项
    updateVisible?: Reducer<IReducer>; // 显示弹出modal
    updateActionType?: Reducer<IReducer>;  // 弹出框类型
    updateState?: Reducer<IReducer>; // 更改'%=nameSpace=%'下 state
  };
}