# README

# Read Attention!
해당 자료는 강원대학교 멋쟁이 사자처럼 5기 팀의 프로젝트 입니다.<br/>

# Kangwon Univ. Community Prototype
* Ruby version : Ruby 2.3.0, Rails 5.1.0
* Team : 김상열 / 김철민 / 이근식 / 서현석

오픈소스를 사용하기 위해서는 아래의 절차를 따라주세요
1. redis-server 키기<br/>
`redis-server`
2. 검색엔진을 사용 전에 아래 3개의 명령어를 입력해야 합니다. (C9, 리눅스 기준)
* 참고 : [클릭](https://github.com/oneandzeroteam/oneandzeroWeb)
    1) `wget https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/deb/elasticsearch/2.2.0/elasticsearch-2.2.0.deb`
    * 참고 : /elasticsearch-2.2.0.deb 파일이 없을 시 위 첫번 째 명령어 입력할 것, 파일이 있으면 입력 안해도 됨.
    2) `sudo dpkg -i elasticsearch-2.2.0.deb`
    3) `sudo update-rc.d elasticsearch defaults 95 10`
    4) `sudo /etc/init.d/elasticsearch start`<br/>
    
# 버그 및 해결과제
1. Heroku 환경에서 '쪽지확인' 기능 문제점 해결해야함.
* 에러메세지 : `Error connecting to Redis on 127.0.0.1:6379`
2. EC2 배포 안되는 문제 해결해야함.<br/>
3. '투표' 게시판에서 블라인드 기능 먹히게 해야함. / '투표' 게시판 댓글이 바로 안달리는 문제(F5 눌러야 댓글이 달린게 보임) 해결해야함.
4. 메인 : 최대 좋아요, 최대 조회수 기능이 이상함.
5. 게시판 : 이전글, 다음글 구현해야함.