/*
 * @version: v0.0.1
 * @Author: %={author}=%
 * @Date: %=gmtTime=%
 * @LastEditors: %={author}=%
 * @Description: %=title=%-model
 */
import { %=typeName=%ModelType, %=typeName=%State } from './definition';
import { fetchSave, fetchDelete, fetchList, fetchDetail } from './service';

const %=nameSpace=%: %=typeName=%ModelType = {
  namespace: '%=nameSpace=%',
  state: {
    data: [], // 列表
    loading: false,
    selectedRowKeys: [],
    total: 0,
    currentPage: 1,
    pageSize: 10,
    currentItem: {},
    query: {},
    simpleSearch: true
  },

  effects: {
     // 添加和保存
    *save(action, { call }) {
      const response = yield call(fetchSave, action.payload);
      return response;
    },
    // 删除
    *del({ payload }, { call }) {
      const res = yield call(fetchDelete, payload);
      return res;
    },
    // 列表
    *loadList({ payload }, { call, put, select }) {
      const state = yield select((state: {%=nameSpace=%: %=typeName=%State}) => state.%=nameSpace=%);
      const { currentPage, pageSize, query } = state;
      const params = { currentPage: currentPage, pageSize, ...query, ...payload };
      yield put({
        type: 'updateState',
        payload: { loading: true },
      });
      const response = yield call(fetchList, params);
      yield put({
        type: 'updateList',
        payload: response,
      });
     yield put({
        type: 'updateState',
        payload: { loading: false },
      });
    },
    // 详情
    *loadDetail({payload}, { call, put, select }) {
      const state = yield select((state: {%=nameSpace=%: %=typeName=%State}) => state.%=nameSpace=%);
      const { currentItem } = state;
      const params = {
        id: currentItem.id,
        payload,
      }
      yield put({
        type: 'updateState',
        payload: { detailLoading: true },
      });
      const response = yield call(fetchDetail, params);
      yield put({
        type: 'updateState',
        payload: { detailLoading: false },
      });
    },
  },

  reducers: {
    // 重置查询条件
    initQuery(state, { payload }) {
      return {
        ...state,
        query: payload,
      };
    },
    // 更新查询条件
    updateQuery(state, { payload }) {
      return {
        ...state,
        ...payload,
      };
    },
    // 切换简单/高级
    updateSimpleSearch(state, { payload }) {
      return {
        ...state,
        ...payload,
      };
    },
    // 更新列表
    updateList(state, { payload }) {
      return {
        ...state,
        data: payload.data ? payload.data.list : [],
        total: payload.data.total,
        selectedRowKeys: [],
      };
    },
    // 列表项多选
    updateSelectedRowKeys(state, { payload }) {
      return {
        ...state,
        selectedRowKeys: payload,
      }
    },
    // 更改页码
    updatecurrentPage(state, { payload }) {
      return {
        ...state,
        currentPage: payload,
      };
    },
    // 更改页展示条数
    updatePageSize(state, { payload }) {
      return {
        ...state,
        pageSize: payload,
      };
    },
    // 更改loading 状态
    updateLoading(state, { payload }) {
      return {
        ...state,
        loading: payload,
      };
    },
    // 当前选中列表项
    updateCurrentItem(state, { payload }) {
      return {
        ...state,
        currentItem: payload, // 添加时清空当前内容
      };
    },
    // 显示弹出modal
    updateVisible(state, { payload }) {
      return {
        ...state,
        visible: payload,
      };
    },
    // 弹出框类型
    updateActionType(state, { payload }) {
      return {
        ...state,
        actionType: payload,
      };
    },
    // 更新state
    updateState(state, { payload }) {
      return {
        ...state,
        ...payload,
      };
    },
  },
};

export default %=nameSpace=%;
