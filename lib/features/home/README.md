# Home Feature

`home` 은 독립 비즈니스 feature가 아니라 여러 feature로 이동하는 조합 화면이다.

현재 원칙:

- 얇은 조합 UI는 `presentation/pages`, `presentation/widgets` 에 둔다
- 여러 feature provider를 조합하는 정도의 단순 상태는 page/widget에서 처리 가능하다
- 홈 전용 파생 상태가 생기면 그때 `presentation/providers/` 추가를 검토한다
- 홈이 독립 비즈니스 기능으로 커질 때만 `data/`, `domain/` 도입을 검토한다
