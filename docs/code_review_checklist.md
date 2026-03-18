# Code Review Checklist

이 체크리스트는 `AGENTS.md`의 구조 원칙을 기반으로 작성되었습니다.

리뷰는 기능 동작뿐 아니라 구조/계층/DI 규칙 유지 여부를 함께 확인합니다.  
AGENTS.md 위반이 있다면 기능이 맞아도 바로 머지하지 않습니다.

---

## 1. 구조

- [ ] 파일 위치가 계층 책임과 맞는가?
- [ ] feature-specific 코드가 `shared` 또는 `core`로 올라가지 않았는가?
- [ ] 공용 UI가 `shared/widgets`에만 존재하는가?
- [ ] `home`이 조합 화면 성격을 넘어서 불필요하게 비대해지지 않았는가?

---

## 2. 계층

- [ ] presentation이 repository impl이나 datasource를 직접 알지 않는가?
- [ ] domain이 data/presentation을 import하지 않는가?
- [ ] shared가 feature를 import하지 않는가?
- [ ] core가 feature를 import하지 않는가?

---

## 3. DI / Provider

- [ ] `feature_repository_providers.dart`가 repository binding만 담당하는가?
- [ ] controller / UI provider / query provider가 `app/di`에 들어가지 않았는가?
- [ ] feature-local 상태는 해당 feature 내부 provider/controller에 남아 있는가?

---

## 4. Riverpod

- [ ] 상태 전이는 controller에 있는가?
- [ ] 단순 조회/파생값은 provider로 분리되어 있는가?
- [ ] provider 초기화/생성자에 과도한 로직이 들어가지 않았는가?
- [ ] generated 파일을 수동 수정하지 않았는가?

---

## 5. 데이터

- [ ] JSON 직렬화가 model에만 존재하는가?
- [ ] mapper가 entity ↔ model 변환 책임에 머무는가?
- [ ] repository interface와 implementation이 분리되어 있는가?
- [ ] datasource 구조가 local/remote 또는 그에 준하는 명확한 형태를 유지하는가?

---

## 6. 네이밍

- [ ] `*_controller.dart`, `*_provider.dart`, `*_state.dart` 규칙이 유지되는가?
- [ ] presentation 계층에 `service`, `manager`, 모호한 `providers.dart`가 없는가?
- [ ] 파일명만 보고 책임이 드러나는가?
- [ ] mapper 파일명이 단수형 규칙과 일치하는가?

---

## 7. Shared / Generated / Docs

- [ ] `shared/widgets`가 feature 의존 없는 공용 UI만 포함하는가?
- [ ] `shared/generated`가 잡탕 폴더처럼 사용되지 않았는가?
- [ ] 구조나 흐름 변경 시 `README.md`, `AGENTS.md`, 관련 폴더 README가 함께 갱신되었는가?

---

## 8. 검증

- [ ] `dart run build_runner build -d` 결과와 변경이 일치하는가?
- [ ] `flutter analyze`가 통과하는가?
- [ ] `flutter test`가 통과하는가?
- [ ] auth/router/products/posts 영향이 크면 smoke/integration 관점까지 확인했는가?

---

## 리뷰 원칙

- AGENTS.md 원칙 위반은 기능 정합성과 별개로 리뷰 이슈로 본다.
- 예외가 필요한 경우, PR 설명에 사유/대안/임시 여부가 명시되어야 한다.
- 구조를 흐리게 만드는 "편의성 위주 변경"은 장기 유지보수 비용까지 고려해 판단한다.
