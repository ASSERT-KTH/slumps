/**
 * Layout component that queries for data
 * with Gatsby's useStaticQuery component
 *
 * See: https://www.gatsbyjs.org/docs/use-static-query/
 */

import React from "react"
import PropTypes from "prop-types"
import { useStaticQuery, graphql } from "gatsby"
import { Layout as L2, Card, Alert, Anchor, Col, Row, BackTop} from 'antd';

import Header from "./header"
import "../assets/layout.scss"

const {Meta} = Card;
const {Link} = Anchor;
const { Content, Footer } = L2;

const Layout = ({ children }) => {
  const data = useStaticQuery(graphql`
    query SiteTitleQuery {
      site {
        siteMetadata {
          title
        }
      }
    }
  `)

  return (
    <React.Fragment>
      <Header siteTitle={data.site.siteMetadata.title} />
      
      <L2>
        <Alert message="Under construction" banner />
        

            {children}
             
          <Footer style={{ textAlign: 'center' }}>ASSERT ©{new Date().getFullYear()} KTH Royal Instutite of Technology</Footer>
        </L2>
    </React.Fragment>
  )
}

Layout.propTypes = {
  children: PropTypes.node.isRequired,
}

export default Layout
