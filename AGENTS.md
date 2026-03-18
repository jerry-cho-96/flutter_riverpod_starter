# Repository Guidelines

## Project Intent

이 저장소는 Flutter + Riverpod 3 기반 starter kit이다.  
목표는 "예제 하나만 돌아가는 샘플"이 아니라, 이후 다른 앱이 그대로 복제해서 시작할 수 있는 실무형 기본 구조를 유지하는 것이다.

AI agent는 새 기능을 추가할 때 항상 아래 두 가지를 먼저 확인해야 한다.

1. 이 변경이 `starter 구조 원칙`을 깨지 않는가
2. 이 변경이 `DummyJSON 단일 API 구조`를 깨지 않는가

## Required Architecture

`lib/`는 반드시 `app/`, `core/`, `features/`, `shared/`로 유지한다.

- `lib/app/`
  앱 전역 설정만 둔다.
  bootstrap, env, flavor, router, theme, DI provider
- `lib/core/`
  여러 feature에서 공통으로 쓰는 기술 코드만 둔다.
  network, storage, error, base state, constants, utils
- `lib/features/<feature>/`
  실제 기능 코드를 둔다.
  feature 내부는 `data/`, `domain/`, `presentation/` 레이어를 유지한다.
- `lib/shared/`
  공용 UI 컴포넌트만 둔다.
  현재 공용 UI는 `shared/widgets/async`, `shared/widgets/feedback`, `shared/widgets/buttons`, `shared/widgets/form`, `shared/widgets/layout`, `shared/widgets/text` 기준으로 유지한다.

feature 예시:

- `auth`: DummyJSON 기반 로그인/토큰 저장/토큰 갱신/세션 복원
- `products`: DummyJSON 기반 목록/상세/카테고리/검색/페이징
- `posts`: DummyJSON 기반 목록/상세/생성/수정/삭제
- `home`: 여러 feature로 이동하는 조합 화면이므로 기본적으로 `presentation`만 유지한다.

## Layer Rules

AI agent는 아래 규칙을 반드시 지켜야 한다.

### presentation

- page/widget/provider/controller만 둔다.
- page는 provider만 `watch/read`한다.
- page에서 repository나 datasource를 직접 호출하지 않는다.
- UI 이벤트는 notifier/controller 메서드 호출로 연결한다.

### domain

- entity
- repository interface
- usecase

domain은 Flutter UI 구현 세부사항이나 Dio를 알면 안 된다.
domain entity는 JSON 직렬화 책임을 갖지 않는다.

### data

- datasource
- model
- repository implementation
- mapper

datasource는 HTTP 호출/로컬 저장/원본 파싱까지 담당한다.  
repository implementation은 model을 domain entity로 바꾸는 공식 진입점이다.
JSON 직렬화는 `data/models`에 두고, model ↔ entity 변환은 `data/mappers`에 둔다.

## Feature Folder Detail

feature의 data 계층은 가능하면 아래 구조를 따른다.

- `data/datasources/local`
- `data/datasources/remote`
- `data/models`
- `data/mappers`
- `data/repositories`

remote datasource 추상 타입/구현체는 같은 `remote/` 아래에서 관리한다.

- 추상 타입: `*_remote_data_source.dart`
- 실제 구현: `dio_*_remote_data_source.dart`
- mock 구현: `mock_*_remote_data_source.dart`
- mapper 파일은 가능하면 단수형을 사용한다. 예: `post_mapper.dart`, `product_mapper.dart`

feature의 domain 계층은 비즈니스 액션이 생기면 `usecases/`를 둔다.

- `auth`, `products`, `posts` 는 현재 `domain/usecases`를 사용한다.
- presentation/provider는 가능하면 repository 메서드 직접 호출보다 usecase 경유를 우선한다.

## Riverpod Rules

이 프로젝트는 Riverpod 3 code generation을 기본 전제로 한다.

- provider는 top-level generated provider를 우선 사용한다.
- `StateNotifier`는 사용하지 않는다.
- 동기 UI 상태는 `Notifier`
- 비동기 + 사용자 액션이 있는 상태는 `AsyncNotifier`
- 읽기 전용 단건/목록 조회는 generated `Future` provider 또는 함수형 provider
- 전역 장수 객체만 `keepAlive: true`

중요 금지 규칙:

- page에서 repository 직접 호출 금지
- provider 생성자에 로직 넣기 금지
- generated `*.g.dart`, `*.freezed.dart` 수동 수정 금지
- presentation에서 `*_repository_impl.dart` 직접 import 금지
- repository provider가 필요하면 `app/di/feature_repository_providers.dart`를 우선 본다
- repository 파생 조회 provider(예: 카테고리 목록)는 `app/di`가 아니라 해당 feature `presentation/providers`에 둔다

## API Integration Policy

이 프로젝트의 실제 API는 `DummyJSON` 하나로 통합되어 있다.

- `auth`: `/auth/*`
- `products`: `/products/*`
- `posts`: `/posts/*`

AI agent는 새 API 연동을 추가할 때 별도 Dio 인스턴스를 새로 만들지 말고,
공통 `dioProvider`와 `ApiClient`를 우선 사용해야 한다.

mock/live 분기가 필요하면 `AppEnv.apiMode`를 사용한다.  
feature별 remote datasource provider는 `apiMode`에 따라 `mock_*_remote_data_source` 또는 `dio_*_remote_data_source`를 선택한다.

## API Flow Reference

실제 API 연동을 추가하거나 수정할 때는 아래 흐름을 기준으로 작업한다.

`page -> provider/controller -> usecase -> repository -> datasource -> apiClient(Dio) -> external API`

현재 실제 API 흐름 기준 파일:

- `lib/app/di/network_provider.dart`
- `lib/app/di/feature_repository_providers.dart`
- `lib/features/auth/data/datasources/remote/dio_auth_remote_data_source.dart`
- `lib/features/products/presentation/pages/products_page.dart`
- `lib/features/products/presentation/providers/products_list_controller.dart`
- `lib/features/products/data/datasources/remote/dio_products_remote_data_source.dart`
- `lib/features/posts/presentation/pages/posts_page.dart`
- `lib/features/posts/presentation/providers/posts_list_controller.dart`
- `lib/features/posts/data/datasources/remote/dio_posts_remote_data_source.dart`
- `lib/core/network/api_client.dart`

AI agent는 실제 API 연동을 추가할 때 먼저 위 파일을 읽고 같은 패턴을 따라야 한다.

추가 규칙:

- 인증 API도 예외 없이 공통 `dioProvider`를 사용한다.
- access token 주입은 `network_provider.dart`의 `AuthInterceptor`에서 처리한다.
- feature 내부에서 토큰 헤더를 중복으로 붙이지 않도록 주의한다.
- `AppEnv.apiMode == ApiMode.mock`일 때는 auth/products/posts 모두 feature 내부 mock remote datasource를 사용한다.

## Import Rules

AI agent는 아래 import 규칙을 반드시 지켜야 한다.

### 허용

- presentation -> domain
- presentation -> app/core/shared
- data -> domain
- app -> core/shared/features

### 금지

- domain -> data
- domain -> presentation
- shared -> feature
- core -> feature
- presentation -> \*\_repository_impl.dart

### 권장

- 상대 import 대신 package import 사용

## App DI Boundary

`feature_repository_providers.dart`는 repository binding 전용이다.

절대 넣으면 안 되는 것:

- controller
- query/filter provider
- UI state provider
- mutation provider
- feature-local derived provider

## Naming Rules

- 상태 전이 주체: \*\_controller.dart
- 단순 조회/파생값: \*\_provider.dart
- 상태 모델: \*\_state.dart

금지:

- \*\_service.dart (presentation)
- providers.dart (모호한 이름)
- manager.dart

## Absolute Anti-Patterns

AI agent는 아래를 절대 수행하면 안 된다.

- feature 코드를 shared로 이동
- repository_impl을 presentation에서 직접 import
- domain에 JSON 직렬화 추가
- 새로운 Dio 인스턴스 생성
- provider 안에서 다른 provider를 깊게 체이닝
- 모든 feature를 공통 base class로 추상화

## Logging And Debugging

개발 모드에서는 공통 Dio에 `pretty_dio_logger`가 붙는다.

- 공통 Dio: `lib/app/di/network_provider.dart`

새로운 네트워크 코드는 기존 공통 Dio를 재사용해야 하며,
정말 예외가 아니라면 feature 전용 Dio 인스턴스를 새로 만들지 않는다.

## Build, Test, And Development Commands

기본 명령은 아래를 사용한다.

- `flutter pub get`
- `dart run build_runner build -d`
- `flutter analyze`
- `flutter test`
- `flutter test integration_test/app_smoke_test.dart -d <device-id>`
- `make get|build|analyze|test`

AI agent가 Riverpod/Freezed/JSON 관련 파일을 수정했으면, 작업 완료 전 반드시 `dart run build_runner build -d`를 다시 실행해야 한다.

## Testing Expectations

테스트는 아래 우선순위로 추가한다.

1. provider/repository 단위 테스트
2. widget 테스트
3. integration_test

변경 영향이 아래에 걸리면 smoke/integration 테스트를 확인한다.

- auth
- router
- products
- posts

현재 iOS 시뮬레이터 integration test는 mock auth repository와 fake products/posts repository override를 사용해 UI 플로우를 안정적으로 검증한다.  
즉, 실제 외부 네트워크 성공 여부를 integration test 안정성에 직접 의존시키지 않는다.

## Coding Style

- Flutter 기본 2-space indentation
- `always_use_package_imports`
- `avoid_print`
- `prefer_single_quotes`
- 파일명은 `snake_case.dart`
- 타입은 `PascalCase`
- 멤버는 `camelCase`

설명 주석은 필요한 곳에만 짧고 명확하게 추가한다.  
특히 초심자가 헷갈릴 수 있는 파일에는 "이 파일의 책임"과 "다음으로 읽을 파일"이 드러나도록 작성하는 편이 좋다.

## Documentation Rule

구조나 흐름이 바뀌면 아래도 같이 갱신한다.

- `README.md`
- 필요 시 `AGENTS.md`

특히 아래가 바뀌면 문서 업데이트를 빼먹지 말아야 한다.

- 실행 명령
- env/config key
- feature 구조
- 실제 API 연동 방식
- integration_test 흐름

추가 문서 규칙:

- `features/home/README.md` 에 홈이 조합 화면이라는 기준을 유지한다
- `shared/widgets/README.md` 에 공용 UI 폴더 책임을 유지한다
- `shared/generated/README.md` 에 허용되는 생성물 범위를 유지한다
- feature public entry 파일(`features/<feature>/<feature>.dart`)을 추가했다면 외부 공개 surface만 export 한다

## Commit & Pull Request Guidelines

커밋 규칙:

- Conventional Commits 사용
- 타입: `feat`, `fix`, `docs`, `style`, `refact`, `perf`, `test`, `chore`, `design`
- 제목/본문은 한국어
- 제목은 50자 이하
- 명사형 종결

PR 규칙:

- 요약
- 연결 이슈
- UI 변경 시 스크린샷
- 설정 변경 사항 명시

## Security & Configuration

- 실비밀값 커밋 금지
- base URL, token, env 값은 예시값만 사용
- 환경 키가 바뀌면 `README.md`에 설정법을 같이 적는다
- 현재 런타임 환경 키는 `APP_FLAVOR`, `API_MODE`, `BASE_URL`, `VERBOSE_LOGS` 이다
- `API_MODE=mock` 이면 auth/products/posts는 feature 내부 mock remote datasource를 사용한다
