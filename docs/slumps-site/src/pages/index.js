import React from "react"

import { Layout as L2, Anchor, Row, Col, BackTop} from 'antd';

import "../assets/layout.scss"
import TeamSection from "./sections/team";
import IntroSection from "./sections/intro";
import Benchmarks from "./sections/benchmarks";
import Layout  from "../components/layout";

const {Link} = Anchor;
const {Content } = L2;


const IndexPage = () =>{
  
  return (<React.Fragment>
  <Layout>
   
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
    
  </Layout></React.Fragment>)

}

export default IndexPage
