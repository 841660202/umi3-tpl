/*
 * @version: v0.0.1
 * @Author: %={author}=%
 * @Date: %=gmtTime=%
 * @LastEditors: %={author}=%
 * @Description: %=title=%-upload
 */
import React, {useState, useEffect} from 'react';
import { connect } from 'dva';
import { Input, Form, Modal, Row, Col, Select } from 'antd';
import {IActionType} from '@/commonType'
import Notification from '@/components/_Notification'
import { %=typeName=%, %=typeName=%State } from './definition';
import { GlobalModelState } from '@/models/global';
import './index.less'

interface IProps{
  global?: GlobalModelState;
  %=nameSpace=%?: %=typeName=%State;
  onCancel: () => void;
  dispatch?: any;
  actionType?: IActionType;
}
const %=name=%Upload:React.FC<IProps> = (props) => {
  const [form] = Form.useForm();
  const { dispatch, visible } = props
  const [ uploading, setUploading ] = useState(false);
  const [ fileList, setFileList ] = useState([]);
  // 上传配置
  const uploadProps = {
    onRemove: (file: any) => {
      const index = fileList.indexOf(file);
      const newFileList = fileList.slice();
      newFileList.splice(index, 1);
      setFileList(newFileList)
    },
    beforeUpload: file => {
      setFileList([...fileList, file]);
      return false
    },
    fileList,
  };
  // 上传文件
  const handleUpload = async () => {
    const formData = new FormData();
    fileList.forEach(file => {
      formData.append('files[]', file);
    });
    setUploading(true)
    const res = dispatch({
      type: '%=nameSpace=%/import${capModuleKey}',
      payload: formData,
    });
    setUploading(false);
    setFileList([])
    message.success('导入成功,请查看验证!');
  };
  // 取消弹框
  handleCancel = () => {
    form.resetFields();
    this.props.onCancel();
  };

  return (
    <Modal
      visible={visible}
      title="导入数据"
      style={styles.modal}
      onOk={handleUpload}
      width={900}
      wrapClassName="sys-depart-dialog"
      onCancel={handleCancel}
      confirmLoading={uploading}
    >
      <div>
        <div style={ {marginBottom: 20} }><a>模版下载</a></div>
        <Upload.Dragger {...uploadProps}>
          <p className="ant-upload-drag-icon">
            <Icon type="inbox" />
          </p>
          <p className="ant-upload-text">点击或将文件拖拽到这里上传</p>
        </Upload.Dragger>
      </div>
    </Modal>
  );
}

export default connect((
  state: {
    %=nameSpace=%: %=typeName=%State;
    global: GlobalModelState;
  }
)=>({
  %=nameSpace=%: state.%=nameSpace=%,
  global: state.global,
}))
