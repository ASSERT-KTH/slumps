import React from "react"

import { Layout, Card, Alert, Anchor, Col, Row, BackTop} from 'antd';

import "../assets/layout.scss"
import TeamSection from "./sections/team";
import IntroSection from "./sections/intro";
import Benchmarks from "./sections/benchmarks";

const {Meta} = Card;
const {Link} = Anchor;
const { Header, Content, Footer } = Layout;


const IndexPage = () =>{
  
  return (<React.Fragment>
  <Layout>
   <Alert message="Under construction" banner />
   
   <Row>
     <Col span={24}>
      <Anchor style={{background: 'transparent', marginLeft: 10, position:'absolute'}} >
            <Link href="#intro" title="Where are we?" />
            <Link href="#benchmarks" title="Our Benchmarks" />
            <Link href="#team" title="The Team" />
        </Anchor>
        <BackTop />

        <Content style={{  marginTop: 64, maxWidth: 1440, marginLeft: 'auto', marginRight: 'auto'}}>
            <a  id="intro"></a>
            <IntroSection/>
            <Benchmarks />
            <TeamSection />
        </Content>
     </Col>
   </Row>
    
    <Footer style={{ textAlign: 'center' }}>ASSERT ©2019 KTH Royal Instutite of Technology</Footer>
  </Layout></React.Fragment>)

}

export default IndexPage
