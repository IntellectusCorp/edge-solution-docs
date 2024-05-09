/*
 * This is a combined version of the following workspaces:
 *
*/
workspace "Int2 Solution Documents"  {
    description "Describe the integrated scenario based on Int2 Data Fabric."
    !docs docs

    # element is only available on the Structurizr cloud service/on-premises installation/Lite
    model {
        properties {
            "structurizr.groupSeparator" "/"
        }

        group "Bacumen" {
            !include model/bacumen.dsl
        }

        group "Int2Fabric" {
            !include model/data-fabric.dsl
        }

        # relations Bacumen <> Int2Fabric
        bacumenVisualizationPanel -> streamDatabase

        #temp

        group "EdgePlatform" {

            edgeComputingPlatform = softwaresystem "Edge Computing Platform" {
                description "Edge Computing Platform"
                properties {
                    "Owner" "intellectus.software"
                } 

                edgeHub = container "Hub Device" {
                    description "Edge Hub to integrate and orchastrate data from the sensor network."

                    edgeDds = component "Edge Data Distribution System" {
                        description "DDS"
                    }

                    fabricDatapipelineAgent = component "Data Fabric Data-pipeline Agent" {
                        description "Data Fabric Data-pipeline Agent"
                    }
                } 
            }

            # relations to/from Edge Solution
            fabricDatapipelineAgent -> streamApi
            edgeHub -> streamRouter

        } 

        fabricApiProvider -> bacumenApi

        metaGin -> fabricBroker
        metaGin -> fabricDataCatalog "analyze"
        metaGin -> oddSpecification

        activeMetadata -> activeMetadataDb

        oddSpecification -> fabricDataCatalog 
        oddSpecification -> fabricBroker 

    }

    views {
        properties {
            "c4plantuml.elementProperties" "true"
            # with c4plantuml.tags set as true, it's enable to apply custom styles 
            "c4plantuml.tags" "true" 
            "generatr.style.colors.primary" "#485fc7"
            "generatr.style.colors.secondary" "#ffffff"
            
            // "generatr.style.faviconPath" "site/favicon.ico"
            // "generatr.style.logoPath" "site/logo.png"
        }

        systemlandscape "SystemLandscape" {
            include *
            autoLayout
        }

        systemcontext dataFabric "SystemContext" {
            include *
            animation {
               dataFabric
            }
            autoLayout
        }

        systemcontext dataFabric "SystemContextForEdgeComputingPlatform" {
            include *
            animation {
               dataFabric
            }
            autoLayout lr
        }

        container dataFabric "ContainersForDataFabric" {
            include *
            autoLayout
        }

        container bacumen "ContainersForBacumen" {
            include *
            autoLayout
        }

        dynamic activeMetadata "WorkflowBuildingFabricDataCatalog" "Fabric Data Catalog 구축 흐름도" {
            fabricBroker -> metaGin
            metaGin -> oddSpecification "analyze"
            oddSpecification -> fabricDataCatalog "convert"
            
            autoLayout lr
            description "workflow to build Local Knowledge Graph"
        }

        
        dynamic bacumen "BacumenDatasourceConnect" "Bacumen에서 대시보드에 표시할 데이터소스 연동" {
            edgeHub -> streamApi "Data Ingestion"
            streamApi -> streamObjectStorage "store"
            bacumenApi -> fabricApiProvider "Request to access to specific dataource"
            bacumenVisualizationPanel -> streamDatabase "connect"
        }

        dynamic bacumen "BacumenPubMessageToEdge" "Bacumen에서 Edge에 메시지 전송" {
            bacumenApi -> fabricApiProvider "Regist Webhook url on subscription topic"
            edgeHub -> streamApi "Publish message"
            streamApi -> fabricApiProvider "notify"
            fabricApiProvider -> bacumenApi "Call webhook with message payload"

            autoLayout lr
        }

        dynamic dataFabric "StreamDataIngestion" "Edge에서 Int2 Fabric 으로 데이터 수집" {
            edgeHub -> streamRouter "publish messages"
            streamClient -> streamRouter "subscribe"
            streamClient -> streamDatabase "store"

        }

        styles {
            
            element "Software System" {
                background #1168bd
                color #ffffff
            }

            element "Hycon" {
                background #FFD470
                color #4a4a4a
            }

            element "Web Browser" {
                shape WebBrowser
            }
            element "Database" {
                shape Cylinder
            }

            element "Customer" {
                background #08427b
            }
            element "Bank Staff" {
                background #999999
            }
            element "Container" {
                background #438dd5
                color #ffffff
            }
            
            element "Mobile App" {
                shape MobileDeviceLandscape
            }
            element "Knowledge Graph Database" {
                shape Cylinder
            }
        }
    }
}