# README

# Read Attention!
이 자료는 저희 팀이 네이버 D2 자료제출용으로 임시(Pulbic)으로 열어둔 GIT자료입니다.<br/>
이 글을 열람하신 외부인은 아예 배껴서 하는 형식으로 도용하지 말아주세요.<br/>
다만, 참고용으로서는 보셔도 좋습니다.<br/>
This Git repository is 'temporary Public' our team project for D2 Naver Submit.<br/>
Please, Do not use for imitation, but allow to for reference.<br/>

# Kangwon Univ. Community Prototype
* Ruby version : Ruby 2.3.0, Rails 5.1.0
* Team : 김승한 / 이근식 / 서현석 / 김상열 / 김철민
* 장소 : KBS아레나
* Git 자료실 : https://github.com/kbs4674/Kangwon_community.git
* Heroku 자료실 : https://git.heroku.com/knu-beta.git
* ELASTICSEARCH_URL: https://pigokjt1:hgxa20m9e1a3yqad@jasmine-4576368.us-east-1.bonsaisearch.net

# 홈페이지를 보기 위해 사전에 해야 하는 것.
1. redis-server 키기<br/>
`redis-server`
2. 검색엔진을 사용 전에 아래 3개의 명령어를 입력해야 합니다. (C9, 리눅스 기준)
* 참고 : [클릭](https://github.com/oneandzeroteam/oneandzeroWeb)
    1) `wget https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/deb/elasticsearch/2.2.0/elasticsearch-2.2.0.deb`
    * 참고 : /elasticsearch-2.2.0.deb 파일이 없을 시 위 첫번 째 명령어 입력할 것, 파일이 있으면 입력 안해도 됨.
    2) `sudo dpkg -i elasticsearch-2.2.0.deb`
    3) `sudo update-rc.d elasticsearch defaults 95 10`
    4) `sudo /etc/init.d/elasticsearch start`<br/>
    
# 알림
**최종 기록 : 17.8.16, 마지막 기록자 : 김상열**
1. 헤로쿠 주소 : http://knu-beta.herokuapp.com
2. `김철민`이 작업한 내역 중 이해가 안가는 코드는 [블로그](http://blog.naver.com/kbs4674)를 참고해주길 바람.
3. 사소한 것이라도 수정사항이 있을 시 **최소 Commit 메세지에 남기거나, 우리 팀 카톡**에 올려주세요! 
4. C9 작업 시 채팅 - 액션케이블 영향으로 엄청 느린 현상이 발생 시<br/>
   -> 구조적인 문제 개션, redis-server로 성능 향상 by 김상열 170816
5. 채팅 - 액션케이블을 헤로쿠에서 돌아가게 하기 위해서는 헤로쿠 내 모듈인 Add-On을 설치해야 합니다.<br/>
**[참고 : 클릭](https://blog.heroku.com/real_time_rails_implementing_websockets_in_rails_5_with_action_cable#deploying-our-application-to-heroku)**

# 인수인계
**기록자 : 김상열**
1. 쪽지(conversation), 투표(link) 뷰에 대한 개선 요망
2. 카테고리 게시판 내의 댓글이 page 새로고침은 되나 parameter가 안 넘어오는 문제 있음 (ajax)
3. 투표 게시글 내의 댓글은 parameter는 넘어오나 page 새로고침이 안되서 실시간 댓글이 안됨. (새로고침 해야 댓글이 보이며 ajax 개선 요망)
    -> 2,3 번의 문제는 김철민의 대댓글 gem 계획으로 해결 가능 or 댓글 기능 구조 개선
4. [Written By. 철민] 헤로쿠 환경에서 '쪽지함' 이동 시 Redis-to-go 6379 포트 에러, 해결요망<br/>
에러메세지 : `Error connecting to Redis on 127.0.0.1:6379`

**기록자 : 김철민**
1. '이메일 인증 후 회원가입'은 구현이 되어 있으나, 이메일 인증 기능은 막아둔 상태('비밀번호 찾기' 시에만 이메일 전송 가능).
2. 액션케이블 : redis 서버 여는법<br/>
=> 터미널에 `redis-server` 입력
3. /model/post.rb, /model/bulletin, /model/comment.rb에 dependent: :destroy 적용
4. 검색엔진과 rails_db의 충돌로 인해 rails_db Gem 사용을 막았습니다.
5. C9환경에서는 글쓰기 시 TinyMCE(게시글 에디터)와 스크롤이 제대로 먹히지 않습니다. (이럴 땐 F5를 눌러주면 됩니다.)
6. C9 환경에서 Nav-bar 가로 창을 모바일 크기로 줄일 시, 사이드 메뉴가 안먹힙니다. (헤로쿠에서는 정상)

# 알아두면 좋은 지식
1. **[강추]** 알아두면 좋은 Gem : **[https://www.ruby-toolbox.com/](https://www.ruby-toolbox.com/)**
2. 알아두면 좋은 Gem 2 : **[http://cafe.naver.com/itctsixsens/23](http://cafe.naver.com/itctsixsens/23)**

# 버그 및 해결과제
1. Heroku 환경에서 '쪽지확인' 기능 문제점 해결해야함.
* 에러메세지 : `Error connecting to Redis on 127.0.0.1:6379`
2. EC2 배포 안되는 문제 해결해야함.<br/>
* 이걸 이용해볼까? : https://hackernoon.com/how-to-setup-and-deploy-a-rails-5-app-on-aws-beanstalk-with-postgresql-redis-and-more-88a38355f1ea
3. '투표' 게시판에서 블라인드 기능 먹히게 해야함. / '투표' 게시판 댓글이 바로 안달리는 문제(F5 눌러야 댓글이 달린게 보임) 해결해야함.
4. 메인 : 최대 좋아요, 최대 조회수 기능이 이상함.
5. 게시판 : 이전글, 다음글 구현해야함.