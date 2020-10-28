
import React, { useState } from 'react';
import { Input, Form, Modal, Row, Col, Select, DatePicker } from 'antd';
import { connect } from 'umi';
import Notification from '@/components/_Notification'
import { %=typeName=% } from './definition';
import { modalBodyStyle, modalStyle } from '@/consts';
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

const %=name=%Detail: React.FC<any> = (props) => {
  const [form] = Form.useForm();
  const { onCancel, visible, dispatch, record, actionType } = props;
  const [fValues, setfValues] = useState<any>(record);
  const isAdd = actionType === "isAdd";
  const handleSubmit = () => {
    form.validateFields().then(async(values: FormValueType) => {
        const params = {
          ...values
        }
        if (isAdd) {
          params.id = record ? record.id : null
        }
        const res = await dispatch({
          type: '%=typeName=%/save',
          payload: params
        })
        if (res && res.data) {
          Notification.success("保存成功")
          refreshData()
        }
      })
      .catch(info => {
        console.log('Validate Failed:', info);
      });
  }
  const handleSubmitApprove = () => {
    form.validateFields().then(async(values: FormValueType) => {
        const params = {
          ...values
        }
        if (isAdd) {
          params.id = record ? record.id : null
        }
        const res = await dispatch({
          type: '%=typeName=%/save',
          payload: params
        })
        if (res && res.data) {
          Notification.success("保存成功")
          refreshData()
        }
      })
      .catch(info => {
        console.log('Validate Failed:', info);
      });
  }

  const handleReset = () => {
    form.resetFields()
    // TODO: clear storage
  }
  const refreshData = () => {
    dispatch({
      type: '%=typeName=%/loadList',
    })
    onCancel()
  }
  return (
    <Drawer
      width={900}
      destroyOnClose
      title="%=title=%"
      placement="right"
      visible={visible}
      onCancel={() => onCancel()}
    >
      <Form
        form={form}
        {...formItemLayout}
        initialValues={record}
        name="basic"
      >
        <Row>
          <Col span={12}>
          %=#attributes=%
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
          %=/attributes=%
          </Col>
        </Row>
        <section>
          <Button onOk={handleReset}>重置</Button>  
          <Divider type="vertical" />
          <Button type="primary" onOk={handleSubmit}>保存</Button> 
          <Divider type="vertical" /> 
          <Button type="primary" onOk={handleSubmitApprove}>保存并审核</Button>  
        </section>
      </Form>
    </Drawer>
  );
};
export default connect((state: any) => ({
  %=typeName=%: state.%=typeName=%,
  global: state.global,
}))(%=name=%Detail);