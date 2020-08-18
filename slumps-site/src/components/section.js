import React from "react"

import { Layout, Menu, Breadcrumb, Button, Avatar, Card, Divider, Row, Col} from 'antd';
import { useStaticQuery, graphql } from "gatsby"



const {Meta} = Card;
const { Header, Content, Footer } = Layout;


const Section = ({name, children, color}) =>{
  
    return ( <div style={{ padding: 24, minHeight: 380, background: color, marginBottom: 100, marginTop: 40 }}>
            <Divider style={{marginBottom: 30}}><h2>{name}</h2></Divider>
            {children}
        </div>
  )

}

export default Section
