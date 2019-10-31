import React from "react"

import { Layout, Menu, Breadcrumb, Button, Avatar, Card, Divider, Row, Col, Badge, Collapse, Alert} from 'antd';
import { useStaticQuery, graphql } from "gatsby"
import Section from "../../components/section";

import memory from "../../data/vulnerabilities";

const {Meta} = Card;
const { Header, Content, Footer } = Layout;
const { Panel } = Collapse;


const Benchmarks = () =>{
  

const customPanelStyle = {
  borderRadius: 4,
  border: 0,
  overflow: 'hidden',
};

  return (
  <Section name="Our Benchmarks">
    
    <p className="center-p">A collection of Webassembly programs used to evaluate our research</p>
    



    <Divider>Target Vulnerabilities </Divider>

    <p className="center-p">One of our goals is to tackle vulnerabilities in WASM binaries</p>

    <Divider>
      <h5>From the 90's to nowadays web applications <Badge count={4} style={{ backgroundColor: '#fff', color: '#999', boxShadow: '0 0 0 1px #d9d9d9 inset' }} /></h5>
    </Divider>

    <p>
    Usually, nobody writes pure Wasm binaries, even the textual representation of it. Instead, developers use to-wasm compilation features of known compilers (more than 20 known <a jref=" https://github.com/mbasso/awesome-wasm">compilers</a> allow wasm generation from their languages). 
    Individually, in the case of C/C++ project migration, <a hreef="https://emscripten.org/">Emscripten compiler</a> is leading the conversion to Wasm. Emscripten also brings a JS wrapper for native C function used in the original code, including the old known <strong>snprintf</strong> function. 
    Without the correct actions to sanitize the migrated code, Emscripten put the original vulnerabilities to the final Wasm binary. 
    
    <br/>

    We selected four vulnerabiities from the security report of <a href="https://www.forcepoint.com/sites/default/files/resources/files/report-web-assembly-memory-safety-en.pdf">J. Bergbom in 2018</a>. The snippets bellow show the original code in C.
   
    </p>
    
    <Collapse >
      {
        memory.map((item, index) => {

         return (<Panel style={customPanelStyle} header={item.name} key={index}>
            <Row style={{width: '100%'}} >
              <Col span={16}>
                <p style={{margin: 10}} dangerouslySetInnerHTML={{__html: item.description}}>
                </p>
              </Col>
              <Col soan={8}>
                <pre className="code">
<code>
                   {item.code}
</code>
                </pre>
              </Col>
            </Row>
          </Panel>)
        })
      }
    </Collapse>

    <Divider>
      <h5>Crypto libraries <Badge showZero count={0} style={{ backgroundColor: '#fff', color: '#999', boxShadow: '0 0 0 1px #d9d9d9 inset' }} /></h5>
    </Divider>

    <Alert message="Coming soon" type="info" showIcon />

  </Section>)

}

export default Benchmarks
