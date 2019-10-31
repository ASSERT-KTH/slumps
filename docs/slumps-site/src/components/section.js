import React from "react"

import { Layout, Menu, Breadcrumb, Button, Avatar, Card, Divider, Row, Col} from 'antd';
import { useStaticQuery, graphql } from "gatsby"



const {Meta} = Card;
const { Header, Content, Footer } = Layout;


const Section = ({name, children, color}) =>{
  
    return ( <div style={{ padding: 24, minHeight: 380, background: color }}>
            <Divider style={{marginBottom: 30}}>{name}</Divider>
            {children}
        </div>
  )

}

export default Section
