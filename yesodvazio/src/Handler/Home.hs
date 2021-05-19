{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Handler.Home where

import Import
import Text.Cassius

--import Network.HTTP.Types.Status
--import Database.Persist.Postgresql

getPage1R :: Handler Html
getPage1R = do
  defaultLayout $ do
    -- CSS
    toWidgetHead $(cassiusFile "templates/entrada.cassius")
        -- css menu
    toWidgetHead $(cassiusFile "templates/home.cassius") 
    -- html
    $(whamletFile "templates/entrada.hamlet")

getPage2R :: Handler Html
getPage2R = do
  defaultLayout $ do
    -- CSS saida
    toWidgetHead $(cassiusFile "templates/saida.cassius") 
        -- css menu
    toWidgetHead $(cassiusFile "templates/home.cassius")
    -- html
    $(whamletFile "templates/saida.hamlet")

getPage3R :: Handler Html
getPage3R = do
  defaultLayout $ do
     -- CSS/bootstrap.css
    addStylesheet (StaticR css_bootstrap_css)
    -- CSS estoque
    toWidgetHead $(cassiusFile "templates/estoque.cassius") 
    -- css menu
    toWidgetHead $(cassiusFile "templates/home.cassius")
    -- html
    $(whamletFile "templates/estoque.hamlet")

getHomeR :: Handler Html
getHomeR = do
  defaultLayout $ do
    -- CSS/bootstrap.css
    addStylesheet (StaticR css_bootstrap_css)
    toWidgetHead $(cassiusFile "templates/home.cassius")
      
    [whamlet|

        <div class="menu">
            <ul>    
                <li>
                    <a href=@{Page1R}>
                        Entrada de Produtos
                <li>
                    <a href=@{Page2R}>
                        Saida de Produtos
                <li>
                    <a href=@{Page3R}>
                        Estoque
        |]
