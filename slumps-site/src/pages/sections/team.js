import React from "react"

import { Layout, Menu, Breadcrumb, Button, Avatar, Card, Divider, Row, Col} from 'antd';
import { useStaticQuery, graphql } from "gatsby"
import Section from "../../components/section";



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


  return (<Section name="Team" color="#fff"> 

<a id="team"></a>
    
        <Row type="flex" justify="center">
         
        {team.map((item, index) => {
            return  (  <Col key={`team${index}`} span={2}>

                <div className="teamContainer">
                
                    <Avatar shape="square" src={item.img} size={96} icon="user" />
                    <h5>{item.name}</h5>
                </div>

                {/*<Card
                  
                  style={{ width: 200, smargin: '15px' }}
                  cover={<img alt="example" src={item.img} />}
                >
                      <Meta title={item.name} description={item.description} />

                </Card>*/}</Col> )
        })}
          
        </Row></Section>)

}

export default TeamSection
