import React, {useState, useEffect, useRef} from 'react';
import { connect } from 'dva';
import {
  Form,
  Button,
  Menu,
} from 'antd';
import {history} from 'umi';
import { %=typeName=%State, %=typeName=% } from './definition';
import { GlobalModelState } from '@/models/global';

interface IProps {
  dispatch?: any;
  %=nameSpace=%?: %=typeName=%State;
  global?: GlobalModelState;
  times?: any[], 
  time?: any,
}

const %=name=%Detail:React.FC<IProps> = (props) => {
  // props
  const { dispatch, times, time, currentItem } = props;
  // hooks
  const refChild = useRef()

  const [isForm, setIsForm] = useState(false)
  const [formLoading, setFormLoading] = useState(false)

  useEffect(()=>{
    loadNav();
    getAllDeparts();
  },[])

  const loadNav = async (values?: %=typeName=%) => {
    const time = dispatch({
      type: '%=nameSpace=%/loadNav',
      payload: values,
    })
    loadContentByNav(time);
  };

  const getAllDeparts = () => {
    dispatch({
      type: 'global/getAllDeparts',
    });
  };

  const handleHideFrom = () => {
    dispatch({
      type: '%=nameSpace=%/updateVisible',
      payload: false,
    });
  };

  const loadContentByNav = (time: string) => {
    dispatch({
      type: '%=nameSpace=%/loadContentByNav',
      payload: {
        deviceCode: '',
        time,
      },
    });
  };

  const updateState = (obj: any) => {
    dispatch({
      type: '%=nameSpace=%/updateState',
      payload: obj,
    });
  };

  const handleModal = (actionType: any) => {
    dispatch({
      type: '%=nameSpace=%/updateState',
      payload: {
        actionType,
        visible: true,
      },
    });
    setIsForm(true)
  };

  const handleNav = (v: any) => {
    updateState({
      time: (times || []).find(item => item.id === +v.key),
      visible: false,
    });
    setIsForm(false)
    loadContentByNav(v.key);
  };

  const handleSave = () => {
    // refChild.handleSubmit();
  };

  const toggleIsForm = () => {
    setIsForm(false);
  };

  const renderLeftNav = () => {
    return (
      <>
        {
          time && typeof time.id === 'number' && (
            <Menu
              style={{ width: 180 }}
              defaultSelectedKeys={[`${time.id}`]}
              mode="inline"
              theme="light"
              onSelect={handleNav}
            >
              {
                (times || []).map((item: any) => (
                  <Menu.Item key={`${item.id}`}>
                    {item.time}
                  </Menu.Item>
                ))
              }
            </Menu>
          )
        }
      </>
    );
  };

  const renderRightForm = () => {
    return (
      <React.Fragment>
        
      </React.Fragment>
    );
  };

  const goBack = () => {
    updateState({
      visible: false,
    });
    history.goBack();
  };

  render() {
    return (
      <div className="page">
        <section className="page-body">
          <div className="left-right-layout">
            <div className="left" style={ { width: 180 } }>
              {renderLeftNav()}
            </div>
            <div className="right">
              <h3 style={ { textAlign: 'center' } }>{time && time.time}</h3>
              {renderRightForm()}
            </div>
          </div>
        </section>
      </div>
    );
  }
}

export default connect(
  (state: {
    %=nameSpace=%: %=typeName=%State;
    global: GlobalModelState;
  }) => ({
    %=nameSpace=%: state.%=nameSpace=%,
    global: state.global,
  }),
)(%=name=%Detail);