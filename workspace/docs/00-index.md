## 인텔렉투스 솔루션 데모 시나리오

본 웹 사이트는 인텔렉투스에서 제공하고 있는 솔루션에 대한 아키텍처에 관한 문서들을 제공하고 있습니다. 문서들은 기본적으로는 [C4 Model](https://c4model.com/) 에 기반한 산출물이며, 추가적으로는 특정 주제에 최적화된 형태의 문서들도 포함하고 있습니다. 

### 제공하고 있는 문서들

1. [System Context View](data-fabric/context/): 전체 시스템이 외부의 다른 시스템과 어떤 상호 관계가 있는지 나타냅니다. 시스템의 세부 항목들은 의도적으로 생략 합니다. 이해관계자와 역할 등을 표시하여 도메인이나 엔지니어링의 전문적인 배경이 없는 사람도 비교적 쉽게 이해할 수 있습니다. 본 프로젝트에서는 Data Fabric 과 자율주행 빅데이터를 다루는 일종의 Data Lake 인 하이콘의 데이터 파이프라인의 관계 및 다른 분산 데이터 저장소와의 관계를 설명하고 있습니다.

2. [Container diagram](data-fabric/container/): 컨테이너는 코드를 실행하거나 데이터를 저장하는 등 실행/배포 가능한 단위 입니다. 소프트웨어 시스템에서 각 역할에 대한 요소들이 어떻게 배치(deployment)되고 어떠한 기술 사양으로 구현되는지에 대한 정보를 포함하고 있습니다.

### System Landscape Diagram
System Landscape Diagram 은 System Context View 와 동일한 수준에서 시스템이 외부의 요소들과 어떤 관계를 갖는지에 대한 전반적인 뷰를 나타냅니다.
![System Landscape Diagram](embed:SystemContextForEdgeComputingPlatform)