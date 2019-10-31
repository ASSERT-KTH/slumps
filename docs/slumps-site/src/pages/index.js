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
   
    <Content style={{  marginTop: 64}}>
     
         <IntroSection/>
         <Benchmarks />
         <TeamSection />
    </Content>
    <Footer style={{ textAlign: 'center' }}>ASSERT ©2019 KTH Royal Instutite of Technology</Footer>
  </Layout></React.Fragment>)

}

export default IndexPage
