# Flutter Riverpod 최종 점검 체크리스트 (1-Page)

이 체크리스트는 PR 생성 또는 feature 추가 시,  
구조가 무너지지 않았는지 빠르게 검증하기 위한 최종 점검용이다.

---

## 1. 구조 (Structure)

- [ ] `app / core / features / shared` 경계가 유지되는가
- [ ] 공용 UI는 `shared/widgets`에만 존재하는가
- [ ] `core`에 UI 컴포넌트가 포함되지 않았는가
- [ ] feature 코드가 `shared` 또는 `core`로 올라가지 않았는가

---

## 2. DI / Provider (app/di)

- [ ] `feature_repository_providers.dart`는 repository binding만 포함하는가
- [ ] controller / UI provider / query provider가 `app/di`에 존재하지 않는가
- [ ] feature-specific provider는 해당 feature 내부에 있는가

---

## 3. Feature 구조

- [ ] 각 feature는 `data / domain / presentation` 구조를 유지하는가
- [ ] `presentation`은 `pages / providers / widgets`로 분리되어 있는가
- [ ] `home`은 조합 화면일 경우 `data/domain` 없이 얇게 유지되는가

---

## 4. 상태관리 네이밍

- [ ] 상태 전이 주체는 `*_controller.dart`인가
- [ ] 단순 조회/파생값은 `*_provider.dart`인가
- [ ] `service` 네이밍이 presentation에 존재하지 않는가

---

## 5. Domain 계층

- [ ] domain이 `data` 또는 `presentation`을 import하지 않는가
- [ ] domain entity에 `fromJson/toJson`이 없는가
- [ ] JSON 직렬화는 `data/models`에만 존재하는가

---

## 6. Data 계층

- [ ] repository interface와 implementation이 분리되어 있는가
- [ ] datasource가 `local/remote` 또는 명확한 구조로 나뉘어 있는가
- [ ] mapper가 entity ↔ model 변환만 담당하는가

---

## 7. Import 규칙

- [ ] `presentation -> repository_impl` 직접 import가 없는가
- [ ] `shared -> feature` import가 없는가
- [ ] `core -> feature` import가 없는가
- [ ] 상대경로 import 대신 package import를 사용하는가

---

## 8. Shared / Widgets

- [ ] `shared/widgets`는 feature 의존이 없는 공용 UI만 포함하는가
- [ ] 위젯이 적절한 하위 폴더(async/buttons/form/layout/feedback/text)에 위치하는가

---

## 9. Mapper / Naming

- [ ] mapper 파일명이 단수형(`post_mapper.dart`, `product_mapper.dart`)인가
- [ ] 파일명만 보고 역할이 명확히 드러나는가

---

## 10. Public API (Feature Entry)

- [ ] `features/*/*.dart` public entry 파일이 존재하는가 (선택)
- [ ] 외부에 필요한 것만 export하는가
- [ ] 내부 구현(`*_impl`, datasource 등)이 export되지 않는가

---

## 11. Generated / Build

- [ ] `.g.dart` 파일은 원본 파일 근처에 존재하는가
- [ ] `shared/generated`가 잡탕 폴더로 사용되지 않는가

---

## 12. 문서화

- [ ] `AGENTS.md` 규칙이 유지되고 있는가
- [ ] `shared/widgets/README.md` 규칙을 위반하지 않았는가
- [ ] `features/home/README.md`의 역할 정의를 지켰는가
- [ ] `app/di/README.md` 규칙을 위반하지 않았는가

---

## 최종 기준

✔ 구조가 아니라 "책임"이 흐트러지지 않았는가  
✔ 새로운 코드가 기존 규칙을 깨지 않는가  
✔ 다음 개발자/AI가 같은 패턴을 그대로 따를 수 있는가  

---

## 한 줄 체크

👉 "이 코드가 들어가면서 폴더 경계나 역할이 애매해지지 않았는가?"
