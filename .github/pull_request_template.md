## 기준 문서

이 PR은 저장소의 구조/계층/DI/네이밍 규칙을 정의한 `AGENTS.md`를 기준으로 작성되었습니다.

AGENTS.md를 위반하는 변경이 있다면 PR 설명에 반드시 명시해야 합니다.

---

## 변경 요약

- 

---

## 연결 이슈

- 

---

## PR 체크리스트

### 구조
- [ ] AGENTS.md의 구조 원칙(`app / core / features / shared`)을 위반하지 않았다
- [ ] feature-specific 코드가 `shared` 또는 `core`로 올라가지 않았다
- [ ] 공용 UI는 `shared/widgets`에만 추가했다

### 계층
- [ ] presentation에서 repository/datasource를 직접 호출하지 않았다
- [ ] domain이 data/presentation을 import하지 않는다
- [ ] JSON 직렬화 로직을 domain에 추가하지 않았다

### DI
- [ ] `feature_repository_providers.dart`에 repository binding만 추가했다
- [ ] controller / UI provider / query provider를 `app/di`에 추가하지 않았다

### import
- [ ] `presentation -> *_repository_impl.dart` import가 없다
- [ ] `shared -> feature` import가 없다
- [ ] 상대경로 import 대신 package import를 사용했다

### 상태관리
- [ ] 상태 전이는 controller, 파생값/조회는 provider로 분리했다
- [ ] presentation 계층에 `service`, `manager`, 모호한 `providers.dart` 파일을 추가하지 않았다

### 문서
- [ ] 구조/흐름 변경이 있다면 `README.md`, `AGENTS.md`, 관련 README를 갱신했다

### 검증
- [ ] `dart run build_runner build -d` 실행 완료
- [ ] `flutter analyze` 통과
- [ ] `flutter test` 통과

---

## 예외 사항

AGENTS.md 규칙을 위반한 경우 아래를 반드시 작성한다.

- 위반한 규칙:
- 위반 이유:
- 대안 검토:
- 임시인지 여부:

---

## UI 변경 사항

- [ ] UI 변경 없음
- [ ] UI 변경 있음 (스크린샷 첨부)

---

## 추가 메모

- 
