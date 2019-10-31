import React from "react"

import { Layout, Menu, Breadcrumb, Button, Avatar, Card, Divider, Row, Col} from 'antd';
import { useStaticQuery, graphql } from "gatsby"



const {Meta} = Card;
const { Header, Content, Footer } = Layout;


const TeamSection = () =>{
  
const team = useStaticQuery(graphql`
    query {
      allTeamJson {
        edges {
          node 
          { 
            name
            img
          }
        }
      }
    }
  `).allTeamJson.edges.map(t => t.node)


  return (<React.Fragment> <Divider>Our Team</Divider>

        <Row type="flex" justify="center">
         
        {team.map((item, index) => {
            return  (  <Col key={`team${index}`} span={6}><Card
                  
                  style={{ width: 200, margin: '15px' }}
                  cover={<img alt="example" src={item.img} />}
                >
                      <Meta title={item.name} description={item.description} />

                </Card></Col> )
        })}
          
        </Row></React.Fragment>)

}

export default TeamSection
