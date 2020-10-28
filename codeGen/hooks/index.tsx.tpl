/*
 * @version: v0.0.1
 * @Author: %={author}=%
 * @Date: %=gmtTime=%
 * @LastEditors: %={author}=%
 * @Description: %=title=%
 */
import React, {useState, useEffect} from 'react';
import { connect } from 'dva';
import {
  Table,
  Modal,
  Form,
  Button,
  Divider,
  Input,
  Select,
} from 'antd';
import { ACTIVE_STATUS } from '@/const/consts'
import { ColumnProps } from 'antd/lib/table';
import { GlobalModelState } from '@/models/global';
import Notification from '@/components/_Notification';
import SearchForm from '@/components/_SearchForm';
import { %=typeName=%State, %=typeName=% } from './definition';
import %=name=%Form from './form';
import %=name=%Detail from './detail';
import %=name=%Print from './print';
import "./index.less"
const { Column } = Table;

interface Props {
  dispatch: any;
  %=nameSpace=%: %=typeName=%State;
  global: GlobalModelState;
}

const %=name=%Index: React.FC<Props> = (props) =>{
  const scrollX = {
    x: 1280,
  };
  const columns: Array<ColumnProps<%=typeName=%>> = [
    %=#attributes=%
      {
        dataIndex: "%=key=%",
        title: "%=annotation=%",
      },
    %=/attributes=%
  ]
  // props
  const {
    global,
    %=nameSpace=%,
    dispatch,
  } = props;

  const {
    query,
    loading,
    data,
    pageIndex,
    pageSize,
    total,
    selectedRowKeys,
    actionType,
    visible,
    currentItem,
    simpleSearch
  } =  %=nameSpace=%
  useEffect(()=>{
    initPage()
  },[])

  // 页面数据初始化
  const initPage = () => {
    loadList()
  }
  // 加载列表数据
  const loadList = (values?: %=typeName=%) => {
    dispatch({
      type: '%=nameSpace=%/loadList',
      payload: values,
    });
  }
  // 删除操作
  const handleDelete = (): void => {
    showDeleteConfirm()
  };
  // 删除确认
  const showDeleteConfirm = () => {
    Modal.confirm({
      title: `正在进行批量 "删除" 操作,是否继续?`,
      okText: '继续',
      cancelText: '取消',
      onOk: async() => {
        const res = await dispatch({
          type: '%=nameSpace=%/del',
          payload: {
            ids: %=nameSpace=%.selectedRowKeys
          },
        });
        if (res && res.data) {
          Notification.success('删除成功!')
          loadList();
        }
      },
      onCancel: () => {
      },
    });
  };
  // 更改当前页
  const handleChangePage = async(page: number) => {
    await dispatch({
      type: '%=nameSpace=%/updatePageIndex',
      payload: page
    });
    loadList();
  };
  // 更改每页展示条数
  const handleChangePageSize = async(page: number, _pageSize: number) => {
    await dispatch({
      type: '%=nameSpace=%/updatePageSize',
      payload: _pageSize
    });
    await handleChangePage(page);
  };
  // 复选更新
  const onSelectChange = (_selectedRowKeys: any[]) => {
    dispatch({
      type: '%=nameSpace=%/updateSelectedRowKeys',
      payload: _selectedRowKeys,
    })
  }
  // 更新命名空间state
  const updateState = (obj: any) => {
    dispatch({
      type: '%=nameSpace=%/updateState',
      payload: obj,
    })
  }
  // 展示弹框
  const handleModal = (record: %=typeName=%, _actionType: any) => {
    dispatch({
      type: '%=nameSpace=%/updateState',
      payload: {
        currentItem: record,
        actionType: _actionType,
        visible: true,
      },
    });
  };
  // 隐藏弹框
  const toggle = () => {
    updateState({
      visible: false,
    })
  };
  // 查询表单提交
  const handleSubmit = async () => {
    await handleChangePage(1);
  };
  // 表格复选配置项
  const rowSelection = {
    selectedRowKeys,
    onChange: onSelectChange,
  };
  // 渲染弹框
  const renderModal = () => {
    switch (actionType) {
      case 'isAdd':
      case 'isEdit':
        return (
          <%=name=%Form
            visible={visible}
            record={currentItem}
            actionType={actionType}
            onCancel={toggle}
          />
        );
      case 'isDetail':
      return (
        <%=name=%Detail
          visible={visible}
          record={currentItem}
          actionType={actionType}
          onCancel={toggle}
        />
      );
      case 'isPrint':
      return (
        <%=name=%Print
          visible={visible}
          record={currentItem}
          actionType={actionType}
          onCancel={toggle}
        />
      );
      default:
        return null;
    }
  };
  // 查询表单items
  const queryEls = [
    {
      label: '状态',
      name: 'status',
      span: 6,
      ele: (
        <Select
          placeholder="状态"
          allowClear
          showSearch
          filterOption={(input, option) =>
            // @ts-ignore
            option.children.toLowerCase().indexOf(input.toLowerCase()) >= 0
          }
        >
          <Select.Option key={'all'} value={null}>
            全部
          </Select.Option>
          {Object.keys(ACTIVE_STATUS).map((k: any) => (
            <Select.Option key={k} value={k}>
              {ACTIVE_STATUS[k]}
            </Select.Option>
          ))}
        </Select>
      ),
    },
    {
      label: '耗材',
      name: 'productName',
      span: 6,
      ele: <Input allowClear placeholder="耗材" />,
    },
    {
      label: '规格型号',
      name: 'specification',
      span: 6,
      ele: <Input allowClear placeholder="规格型号" />,
    },
    {
      label: '生产厂家',
      name: 'manufacturerName',
      span: 6,
      ele: <Input allowClear placeholder="生产厂家" />,
    },
    {
      label: '条码',
      name: 'barCode',
      span: 6,
      ele: <Input.Search allowClear placeholder="条码" />,
    },
  ];
  // 渲染内容
  return (
    <div className="page">
      <section className="page-body">
        <div className="search-wrap">
          <SearchForm
            initialValues={query}
            modelName="%=nameSpace=%"
            modelState={%=nameSpace=%}
            dispatch={dispatch}
            simpleSearch={simpleSearch}
            handleSubmit={handleSubmit}
            ele={queryEls}
          />
        </div>
        <div className="table-wrap">
          <Table
            dataSource={data}
            bordered
            scroll={scrollX}
            rowKey="id"
            loading={loading}
            locale={{
              emptyText: loading ? '加载中...' : '暂无数据'
            }}
            rowSelection={rowSelection}
            pagination={ {
              current: pageIndex,
              pageSize,
              showQuickJumper: true,
              showSizeChanger: true,
              pageSizeOptions: ['10', '20', '50', '100'],
              total,
              showTotal: (_total, range) => `当前展示${range[0]}-${range[1]}条数据，共有 ${_total} 条数据`,
              onChange: handleChangePage,
              onShowSizeChange: handleChangePageSize
            } }
          >
            {columns.map((column, i) => <Column {...column} key={i} />)}
            <Column
              title="操作"
              dataIndex="action"
              width="80px"
              fixed="right"
              render={(text, _record: %=typeName=%) => (
                <span style={ {textAlign: 'center', display: 'block'} }>
                  <a onClick={() => handleModal(_record, 'isDetail')}>
                    详情
                  </a>
                  <Divider type="vertical" />
                  <a onClick={() => handleModal(_record, 'isPrint')}>
                    打印
                  </a>
                  <Divider type="vertical" />
                  <a onClick={() => handleModal(_record, 'isEdit')}>
                    编辑
                  </a>
                </span>
              )}
            />
          </Table>
        </div>
      </section>
       {renderModal()}
    </div>
  );
}

export default connect(
  (
    state: {
      %=nameSpace=%: %=typeName=%State;
      global: GlobalModelState;
    }
  )=>({
    %=nameSpace=%: state.%=nameSpace=%,
    global: state.global
  })
)(%=name=%Index)
