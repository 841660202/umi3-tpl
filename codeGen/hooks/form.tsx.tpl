/*
 * @version: v0.0.1
 * @Author: %={author}=%
 * @Date: %=gmtTime=%
 * @LastEditors: %={author}=%
 * @Description: %=title=%-form
 */
import React, { useState } from 'react';
import { Input, Form, Modal, Row, Col, Select, DatePicker } from 'antd';
import { connect } from 'umi';
import Notification from '@/components/_Notification'
import { %=typeName=% } from './definition';
import { modalBodyStyle, modalStyle } from '@/const/consts';
import { IActionType } from '@/commonType';
const FormItem = Form.Item;
const formItemLayout = {
  labelCol: {
    xs: { span: 24 },
    sm: { span: 6 }
  },
  wrapperCol: {
    xs: { span: 24 },
    sm: { span: 16 }
  }
};
const formItemLayoutTextarea = {
  labelCol: {
    xs: { span: 24 },
    sm: { span: 3 }
  },
  wrapperCol: {
    xs: { span: 24 },
    sm: { span: 20 }
  }
};

interface FormValueType extends Partial<%=typeName=%> {
  record?: %=typeName=%;
  dispatch?: any;
  actionType?: IActionType;
}

const %=name=%Form: React.FC<any> = (props) => {
  const [form] = Form.useForm();
  const { onCancel, visible, dispatch, record, actionType } = props;
  const [fValues, setfValues] = useState<any>(record);
  const [confirmLoading, setConfirmLoading] = useState<boolean>(false);
  const isAdd = actionType === "isAdd";
  const handleSubmit = () => {
    form.validateFields().then(async(values: FormValueType) => {
        const params = {
          ...values
        }
        if (isAdd) {
          params.id = record ? record.id : null
        }
        setConfirmLoading(true)
        const res = await dispatch({
          type: '%=nameSpace=%/save',
          payload: params
        })
         setConfirmLoading(false)
        if (res && res.data) {
          Notification.success("保存成功")
          refreshData()
        }
      })
      .catch(info => {
        console.log('Validate Failed:', info);
      });
  }
  const refreshData = () => {
    dispatch({
      type: '%=nameSpace=%/loadList',
    })
    onCancel()
  }
  return (
    <Modal
      width={900}
      style={modalStyle}
      bodyStyle={modalBodyStyle}
      destroyOnClose
      title="%=title=%"
      okText="确认"
      cancelText="取消"
      visible={visible}
      onCancel={() => onCancel()}
      onOk={handleSubmit}
      confirmLoading={confirmLoading}
    >
      <Form
        form={form}
        {...formItemLayout}
        initialValues={record}
        name="basic"
      >
        <Row>
         %=#attributes=%
          <Col span={12}>
              <FormItem
                label="%=annotation=%"
                name="%=key=%"
                rules={[{ required: true, message: '请填写!' }]}
              >
                %=!文本=%
                %=#formtext=%
                <Input placeholder="请输入" />
                %=/formtext=%
                %=!块输入框=%
                %=#formtextArea=%
                <Input.textArea placeholder="请输入" />
                %=/formtextArea=%
                %=!日期选择=%
                %=#formdate=%
                <DatePicker placeholder="请输入" />
                %=/formdate=%
                %=!复选框=%
                %=#formcheckbox=%
                <Input placeholder="请输入" />
                %=/formcheckbox=%
                %=!下拉选框=%
                %=#formselect=%
                <Select
                  placeholder="请选择"
                  allowClear
                  showSearch
                  filterOption={(input: any, option: any) =>
                    // @ts-ignore
                    option.children.toLowerCase().indexOf(input.toLowerCase()) >= 0
                  }
                >
                  {[].map((item: ISupplier) => (
                    <Select.Option key={item.id} value={item.id}>
                      {item.name}
                    </Select.Option>
                  ))}
                </Select>
                %=/formselect=%
              </FormItem>
          </Col>
          %=/attributes=%
        </Row>
      </Form>
    </Modal>
  );
};
export default connect((state: any) => ({
  %=nameSpace=%: state.%=nameSpace=%,
  global: state.global,
}))(%=name=%Form);
