       IDENTIFICATION DIVISION.
       PROGRAM-ID. IBM-ZOS.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
         *> z/os : IBM 메인 프레임컴퓨터에서 사용하는 운영체제
         *> Dataset : z/os에서는 파일을 의미
         *>      - AAA.BBB.CCC와 같은 형식으로 구성되어 있으며 USER.COBOL.SOURCE
         *>      - USER01.COBOL.COPYLIB, USER01.DATA.CUSTOMER처점 작성
         *>      - 크게 Sequential Dataset, PDS, VSAM으로 구성

         *> Sequential Dataset : 가장 단순한 Dataset
         *> PDS : 하나의 Dataset안에 여러 개의 파일을 저잘할 수 있는 구조
         *>      - Dataset는 USER01.COBOL.SOURCE이고 그 안에 HELLO, TEST01, TEST02가 있다면
         *>        각각 USER01.COBOL.SOURCE(HELLO), USER01.COBOL.SOURCE(TEST01), USER01.COBOL.SOURCE(TEST02)

         *> VSAM : Virtual Storage Access Method (메인프레임의 고성능 데이터 저장 방식)
         *>      - key 값을 이용하여 바로 접근 가능
         *>      - VSAM의 종류 : KSDS (Key Sequential Data Set), ESDS (Entry Sequential Data Set),
         *>                      RRDS (Relative Record Data Set), LDS (Linear Data Set)

         *>      - 가장 많이 사뇽하는 방식 : KSDS
         *>          - CUSTOMER-ID를 키로 한다면 1001 Kim와 같은 파틸틀 "START CUSTOMER-FILE KEY IS = WS-ID"로 빠르게 처리할 수 있음

         STOP RUN.
       END PROGRAM IBM-ZOS.
