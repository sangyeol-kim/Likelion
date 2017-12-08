class KnuController < ApplicationController
  def knu_world
  end
 
  def key
    @wise_list = ['일단 유명해져라. 그러면 당신이 똥을 싸도 대중은 박수를 쳐 줄 것이다<br/>- 앤디 워홀(?) -', '오직 자신을 믿어라. 자신을 믿지 않더라도 믿는 척해라. 그러면 어느 순간 스스로를 믿게 될 것이다.<br/>- 비너스 윌리엄스 -', '인내는 쓰다. 그러나 그 열매는 달다.<br/>- 루소 -', '성공은 열정의 위축 없이 실패에서 실패로 걸어가는 것이다.<br/>- 윈스톤 처칠 -']
    @wise_ment = @wise_list.sample(1)
    
    @knu_key = params[:input_key]
  end
end
