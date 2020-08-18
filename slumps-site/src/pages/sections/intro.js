import React from "react"

import { Layout, Menu, Breadcrumb, Button, Avatar, Card, Divider, Row, Col, Steps, Icon} from 'antd';
import { useStaticQuery, graphql } from "gatsby"
import Section from "../../components/section";

const {Step} = Steps;
const {Meta} = Card;
const {Content} = Layout;

const IntroSection = () =>{
  
  return (<Content>

          <Divider><h1>SLUMPs</h1></Divider>

          <Row style={{marginBottom: 30}} type="flex" justify="center">
            <Col>
               <Button type="primary" href="https://github.com/KTH/slumps">To GitHub</Button>
            </Col>
          </Row>

          <p className="center-p">Research repository on randomization, fuzzing and superoptimization for WebAssembly/WASM</p>

          
          
          <Section name="What is SLUMPs" color='#fff'>
            <Row type="flex" justify="center">
              <Col span={16}>

              </Col>
            </Row>
            <Row type="flex" justify="center">
              <Col>
                
              </Col>
            </Row>
          </Section>
         
      </Content>)

}

export default IntroSection
