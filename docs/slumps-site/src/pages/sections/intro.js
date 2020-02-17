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

          <p className="center-p">Research on randomization and superoptimization for WebAssembly WASM</p>

          
          
          <Section name="What is SLUMPs" color='#fff'>
            <Row type="flex" justify="center">
              <Col span={16}>

            <p>Given a C program, SLUMPs repurposes a superoptimizer (<a href="https://github.com/google/souper">Souper</a>) to output several equivalent WASM programs.
  For each optimization candidates subset from Souper, we generate a new WASM program</p>

              </Col>
            </Row>
            <Row type="flex" justify="center">
              <Col>
                <Steps direction="vertical" >
                  <Step status="finish" title="C"  description={"C code to be ported in WASM"} icon={<Icon type='code'/>} />
                  <Step status="finish" title="LLVM" description={"Create LLVM bitcode from the C input program. Targeting wasm32-unknown-unknonw as architecture"} icon={<Icon type='api'/>} />
                  <Step status="finish" title="Souper" description={"Souper generates several candidates in the path to the 'opmitimazed' version. We keep those candidates and generate different programs from it"} icon={<Icon type='swap'/>} />
                  <Step status="finish" title="WebAssembly lld port" description={"Generate WebAssembly code from LLVM bitcodes"} icon={<Icon type='api'/>} />
                  <Step status="finish" title="WASMs" description={"Generate different WASM programs from the original C code"} icon={<React.Fragment>
                    <Icon type='code-sandbox'/>
                    <Icon type='dash'/>
                    <Icon type='code-sandbox'/>
                    <Icon type='code-sandbox'/>
                    <Icon type='code-sandbox'/>
                  </React.Fragment>} />
                </Steps>
              </Col>
            </Row>
          </Section>
         
      </Content>)

}

export default IntroSection
