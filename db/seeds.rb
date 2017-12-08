# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

## 관리자 계정의 생성 및 역할지정(관리자가 생성된 후 보안상의 이유로 비밀번호는 반드시 다른 것으로 변경하기 바람.)
# 철민 >_<
admin_user1 = User.create( email: 'kbs4674@naver.com', nickname: 'KCM', password: 'a1274821' )
user = User.find(1)
user.add_role :admin

# 철민 >_<
admin_user2 = User.create( email: 'kbs4674@likelion.org', nickname: 'KCM2',  password: 'a1274821' )
user = User.find(2)
user.add_role :admin

# 상열이
admin_user3 = User.create( email: 'twysg@likelion.org', nickname: '상열',  password: 'duddj1' )
user = User.find(3)
user.add_role :admin

#현석
admin_user4 = User.create( email: 'shsvkdldj@naver.com', nickname: '현석',  password: 'hyeonseok1' )
user = User.find(4)
user.add_role :admin

#기타 테스트계정들
test_user1 = User.create( email: 'test1@naver.com', nickname: '호이쨔',  password: '123456' )
test_user2 = User.create( email: 'test2@naver.com', nickname: '사랑',  password: '123456' )
test_user3 = User.create( email: 'test3@naver.com', nickname: '향기',  password: '123456' )
test_user4 = User.create( email: 'test4@naver.com', nickname: '어둠의전설',  password: '123456' )
test_user5 = User.create( email: 'test5@naver.com', nickname: '마비노기',  password: '123456' )
test_user6 = User.create( email: 'test6@naver.com', nickname: '위베어베어스',  password: '123456' )
test_user7 = User.create( email: 'test7@naver.com', nickname: '명탐정',  password: '123456' )
test_user8 = User.create( email: 'test8@naver.com', nickname: '코난',  password: '123456' )
test_user9 = User.create( email: 'test9@naver.com', nickname: '강철의연금술사',  password: '123456' )
test_user10 = User.create( email: 'test10@naver.com', nickname: 'i5-3570',  password: '123456' )
test_user11 = User.create( email: 'test11@naver.com', nickname: 'GTX-Titan',  password: '123456' )

notice = Bulletin.create( title: "공지사항", content: "중요한 소식 등을 알리는 공지사항 입니다.", user_name: "Default", user_id: "1" )
freeboard = Bulletin.create( title: "자유게시판", content: "자유게시판 입니다^^ 자유롭게 얘기를 나눠보세요!", user_name: "Default", user_id: "1" )
u_more = Bulletin.create( title: "유머게시판", content: "흠칫뿡!", user_name: "Default", user_id: "1" )
qna = Bulletin.create( title: "질문게시판", content: "학교생활을 하면서 궁금한점이 있었다면...", user_name: "Default", user_id: "1" )
disappointment = Bulletin.create( title: "강대메아리", content: "강대 생활에 있어 불편, 불만사항을 고발합니다!", user_name: "Default", user_id: "1" )
