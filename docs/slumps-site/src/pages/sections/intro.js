import React from "react"

import { Layout, Menu, Breadcrumb, Button, Avatar, Card, Divider, Row, Col, Steps, Icon} from 'antd';
import { useStaticQuery, graphql } from "gatsby"
import Section from "../../components/section";

const {Step} = Steps;
const {Meta} = Card;
const {Content} = Layout;

const IntroSection = () =>{
  
  return (<Content>
          <Divider><h1>SLUMPS</h1></Divider>

          <p className="center-p">Research on randomization and superoptimization for WebAssembly WASM</p>

          <Row type="flex" justify="center">
            <Col key={`obj1`} span={4}><Card
                  
                  style={{ margin: '15px' }}
                >
                      <Meta title={"Objective 1"} description={"Lorem ipsum"} />

                </Card>
                
              </Col> 
              <Col key={`obj2`} span={4}><Card
                  
                  style={{ margin: '15px' }}
                >
                      <Meta title={"Objective 2"} description={"Lorem ipsum"} />

                </Card>
                
              </Col> 
              <Col key={`obj3`} span={4}><Card
                  
                  style={{ margin: '15px' }}
                >
                      <Meta title={"Objective 3"} description={"Lorem ipsum"} />

                </Card>
                
              </Col> 
          
          </Row>

          <Section name="Where we are?" color='#fff'>
            <Row type="flex" justify="center">
              <Col>
                <Steps direction="vertical" >
                  <Step status="finish" title="WASM"  description={"WASM binary to Souper IR"} icon={<Icon type='code'/>} />
                  <Step status="process" title="Souper (Work in progress)" description={"Souper generates several candidates in the path to the 'opmitimazed' version. We keep those candidates"} icon={<Icon type='loading'/>} />
                  <Step status="process" title="LLVM (Work in progress)" description={"Get the LLVM IR from the optimization candidates"} icon={<Icon type='loading'/>}  />
                  <Step status="wait" title="WASMs" description={"Generate the mutated versions of the original WASM file"} icon={<React.Fragment>
                    <Icon type='code'/>
                    <Icon type='code'/>
                    <Icon type='code'/>
                    <Icon type='dash'/>
                    <Icon type='code'/>
                  </React.Fragment>} />
                </Steps>
              </Col>
            </Row>
          </Section>
         
      </Content>)

}

export default IntroSection
