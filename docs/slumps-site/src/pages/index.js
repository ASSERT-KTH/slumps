import React from "react"

import { Layout, Card, Alert, Anchor} from 'antd';

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
   
    <Content style={{ padding: '0 50px', marginTop: 64}}>
     
        <div style={{ padding: 4, minHeight: 380 }}>
         <IntroSection/>
         <Benchmarks />
         <TeamSection />
      </div>
    </Content>
    <Footer style={{ textAlign: 'center' }}>ASSERT ©2019</Footer>
  </Layout></React.Fragment>)

}

export default IndexPage
