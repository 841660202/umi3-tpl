/*
 * @version: v0.0.1
 * @Author: %={author}=%
 * @Date: %=gmtTime=%
 * @LastEditors: %={author}=%
 * @Description: %=title=%-print
 */
import React, { useState, useRef } from 'react';
import { Input, Form, Modal, Row, Col, Select, DatePicker } from 'antd';
import { connect } from 'umi';
import Notification from '@/components/_Notification'
import { %=typeName=% } from './definition';
import { modalBodyStyle, modalStyle } from '@/const/consts';
import { IActionType, IProduct } from '@/commonType';
import DetailItem from '@/components/DetailItem';

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

const %=name=%Print: React.FC<any> = (props) => {
  const printRef = useRef()
  const [form] = Form.useForm();
  const { onCancel, visible, dispatch, record, actionType, user } = props;
  const {currentUser} = user;
  const [fValues, setfValues] = useState<any>(record);

  const handlePrint = ()=>{
    window.document.body.innerHTML = printRef.current.innerHTML;
    window.print();
    window.location.reload();
  }
  return (
    <Modal
      width={900}
      style={modalStyle}
      bodyStyle={modalBodyStyle}
      destroyOnClose
      title="%=title=%打印"
      okText="确认"
      cancelText="取消"
      visible={visible}
      onCancel={() => onCancel()}
      onOk={handlePrint}
    >
     <div className="print-wrap">
      <section className="print-head">
        <h3>{(currentUser || {}).warehouseName}入库单</h3>
        <Row>
          %=#attributes=%
          <Col span={8}>
            <DetailItem label="%=annotation=%">{record.%=key=%}</DetailItem>
          </Col>
          %=/attributes=%
        </Row>
      </section>
      <section className="print-body" ref={printRef}>
        <table>
          <thead>
            <tr>
              %=#attributes=%
              <td>%=annotation=%</td>
              %=/attributes=%
            </tr>
          </thead>
          <tbody>
          {
            ([]).map((item: IProduct)=>(
              <tr key={item.id}>
                %=#attributes=%
                <td>{item["%=key=%"]}</td>
                %=/attributes=%
              </tr>
            ))
          }
          </tbody>
        </table>
      </section>
    </div>
  </Modal>
  );
};
export default connect((state: any) => ({
  %=nameSpace=%: state.%=nameSpace=%,
  global: state.global,
  user: state.user,
}))(%=name=%Print);
