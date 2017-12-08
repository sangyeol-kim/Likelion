class Ability
  include CanCan::Ability

## 관리 명칭 설정 (scaffold로 만들어진 CRUD Controller 기준으로 작성됨.)
# :manage - 전체 관리
# :index - 게시판 글 목록
# :show - 게시글 보기
# :new - 게시글 작성 페이지 이동
# :create - 작성자가 작성한 게시글을 게시판에 upload
# :edit - 게시글 편집
# :destroy - 게시글 삭제

  
  ## 유저 권한 주는법
  # 1. rails c 명령어 입력
  # 2. (콘솔 내에서) user = User.find(유저 id값 입력[/rails/db 를 통해서 id값 알아보세요!])
  #    ㄴ 예시 : Admin 권한을 줄려는 계정의 회원번호가 3번인 경우 user = User.find(3)
  # 3. (콘솔 내에서) user.add_role :admin 입력 [이제 해당유저는 admin 권한 획득]
  # 4. [선택] (콘솔 내에서, 2번 과정을 거친 후 / 4번과정은 선택사항 입니다.) 어드민 획득여부 확인 - user.has_role? :admin
  
  def initialize(user)
    #user -> current_user 
      user ||= User.new # guest user (not logged in)
       if user.has_role? :admin #어드민 권한
         can :manage, :all #create, edit 등
       
       elsif user.has_role? :student
         #일반 회원 권한 : 비허용
         cannot [:index, :show, :new, :create], Bulletin
         
         #일반 회원 권한 : 허용
         can [:index, :show, :new, :create], Post
         can [:index, :show, :new, :create, :upvote, :downvote], Link
         
         can [:edit, :update, :destroy], Post, user_id: user.id
         can [:edit, :update, :destroy], Link, user_id: user.id
         
         can :destroy, Comment, user_id: user.id
         can :destroy, VoteComment, user_id: user.id
        
       else
         #일반 회원 권한 : 비허용
         can [:index, :show], :all
       end
    
    #과거 백업본(일반회원 : 상열이가 셋팅한거)
    #can :read, :all #show 등
    #can :new, :all
    #can :list, :all
    #can :create, :all
    #can :show, :all
    #can :edit, Post, user_id: user.id
    #can :update, Post, user_id: user.id
    #can :destroy, Post, user_id: user.id
    #can :edit, Bulletin, user_id: user.id
    #can :update, Bulletin, user_id: user.id
    #can :destroy, Bulletin, user_id: user.id
    #can :destroy, Comment, user_id: user.id
    
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
