# riverpod3_starter

Flutter stable + Riverpod 3 기반 starter kit입니다.  
이 프로젝트는 Flutter를 처음 쓰는 개발자도 아래 순서로 읽으면 빠르게 구조를 이해할 수 있도록 구성했습니다.

## 먼저 이해할 것

- 이 앱은 `DummyJSON` 하나를 공통 API 서버로 사용합니다.
- 로그인은 `DummyJSON Auth API`를 사용합니다.
- 상품 예제는 `DummyJSON Products API`를 사용합니다.
- 게시글 예제는 `DummyJSON Posts API`를 사용하며 `CRUD`까지 포함합니다.
- 상태 관리는 `Riverpod 3`
- 구조는 `feature-first + layered architecture`

## 가장 먼저 실행하기

```bash
flutter pub get
dart run build_runner build -d
flutter analyze
flutter test
flutter run
```

`dart-define` 로 실행 환경을 바꿀 수 있습니다.

```bash
flutter run --dart-define=APP_FLAVOR=dev --dart-define=API_MODE=live
flutter run --dart-define=APP_FLAVOR=dev --dart-define=API_MODE=mock
```

지원 키:

- `APP_FLAVOR`: `dev` | `staging` | `prod`
- `API_MODE`: `live` | `mock`
- `BASE_URL`: 기본값은 `https://dummyjson.com`
- `VERBOSE_LOGS`: `true` | `false`

## 처음 보는 사람을 위한 읽기 순서

Flutter를 처음 시작했다면 모든 파일을 한 번에 읽지 말고 아래 순서로 보세요.

1. [lib/main.dart](/Users/jerry/dev/flutter_project/riverpod3_starter/lib/main.dart)
2. [lib/app/app.dart](/Users/jerry/dev/flutter_project/riverpod3_starter/lib/app/app.dart)
3. [lib/app/router/app_router.dart](/Users/jerry/dev/flutter_project/riverpod3_starter/lib/app/router/app_router.dart)
4. [lib/features/home/presentation/pages/home_page.dart](/Users/jerry/dev/flutter_project/riverpod3_starter/lib/features/home/presentation/pages/home_page.dart)
5. [lib/app/di/network_provider.dart](/Users/jerry/dev/flutter_project/riverpod3_starter/lib/app/di/network_provider.dart)
6. [lib/features/auth/data/datasources/remote/dio_auth_remote_data_source.dart](/Users/jerry/dev/flutter_project/riverpod3_starter/lib/features/auth/data/datasources/remote/dio_auth_remote_data_source.dart)
7. [lib/features/products/presentation/pages/products_page.dart](/Users/jerry/dev/flutter_project/riverpod3_starter/lib/features/products/presentation/pages/products_page.dart)
8. [lib/features/products/data/datasources/remote/dio_products_remote_data_source.dart](/Users/jerry/dev/flutter_project/riverpod3_starter/lib/features/products/data/datasources/remote/dio_products_remote_data_source.dart)
9. [lib/features/posts/presentation/pages/posts_page.dart](/Users/jerry/dev/flutter_project/riverpod3_starter/lib/features/posts/presentation/pages/posts_page.dart)
10. [lib/features/posts/presentation/providers/posts_list_controller.dart](/Users/jerry/dev/flutter_project/riverpod3_starter/lib/features/posts/presentation/providers/posts_list_controller.dart)
11. [lib/features/posts/data/repositories/posts_repository_impl.dart](/Users/jerry/dev/flutter_project/riverpod3_starter/lib/features/posts/data/repositories/posts_repository_impl.dart)
12. [lib/features/posts/data/datasources/remote/dio_posts_remote_data_source.dart](/Users/jerry/dev/flutter_project/riverpod3_starter/lib/features/posts/data/datasources/remote/dio_posts_remote_data_source.dart)
13. [lib/core/network/api_client.dart](/Users/jerry/dev/flutter_project/riverpod3_starter/lib/core/network/api_client.dart)

이 순서대로 보면 "화면에서 버튼을 눌렀을 때 실제 HTTP 호출까지 어떻게 이어지는지"가 자연스럽게 보입니다.

## 디렉터리 구조

```text
lib/
  app/
  core/
  features/
  shared/
```

- `app/`
  앱 전체 설정입니다. `bootstrap`, `router`, `theme`, `env`, 전역 provider가 있습니다.
- `core/`
  여러 feature가 같이 쓰는 기술 기반 코드입니다. `error`, `network`, `storage`, `utils`, 공통 상태가 있습니다.
- `features/`
  실제 기능 폴더입니다. `auth`, `products`, `posts` 같은 업무 단위로 나뉩니다.
  `home`은 독립 비즈니스 feature가 아니라 여러 feature로 이동하는 조합 화면이라 `presentation`만 유지합니다.
  각 feature는 필요 시 `features/<feature>/<feature>.dart` public entry 파일로 외부 공개 surface를 정리합니다.
- `shared/`
  공용 UI 컴포넌트입니다. `async`, `feedback`, `buttons`, `form`, `layout`, `text` 같은 표현 계층을 둡니다.
  `shared/generated` 는 shared 성격이 명확한 생성물만 허용하고, 일반 generated 파일은 원본 소스 옆에 둡니다.

## 로그인 테스트 계정

DummyJSON 문서 예시 계정을 기본값으로 넣어두었습니다.

- username: `emilys`
- password: `emilyspass`

앱을 처음 실행하면 로그인 화면에도 같은 값이 기본 입력되어 있습니다.

## DummyJSON 실제 API 예제 읽는 법

### 1. 홈에서 상품/게시글 페이지로 이동

- 홈 화면의 `상품 예제 보기`, `게시글 CRUD 예제` 버튼을 누르면 실제 API 화면으로 이동합니다.
- 파일:
  [lib/features/home/presentation/pages/home_page.dart](/Users/jerry/dev/flutter_project/riverpod3_starter/lib/features/home/presentation/pages/home_page.dart)

### 2. 페이지는 provider만 본다

- `products` 화면은 `productsListControllerProvider`를 `watch`합니다.
- `posts` 화면은 `postsListControllerProvider`를 `watch`합니다.
- 페이지는 직접 Dio를 호출하지 않습니다.
- 파일:
  [lib/features/products/presentation/pages/products_page.dart](/Users/jerry/dev/flutter_project/riverpod3_starter/lib/features/products/presentation/pages/products_page.dart)
  [lib/features/posts/presentation/pages/posts_page.dart](/Users/jerry/dev/flutter_project/riverpod3_starter/lib/features/posts/presentation/pages/posts_page.dart)

### 3. provider가 첫 비동기 로딩을 시작한다

- `build()`에서 domain usecase를 통해 첫 목록을 가져옵니다.
- 새로고침, 더 불러오기, 게시글 생성/수정/삭제도 provider 메서드에서 처리합니다.
- 파일:
  [lib/features/products/presentation/providers/products_list_controller.dart](/Users/jerry/dev/flutter_project/riverpod3_starter/lib/features/products/presentation/providers/products_list_controller.dart)
  [lib/features/posts/presentation/providers/posts_list_controller.dart](/Users/jerry/dev/flutter_project/riverpod3_starter/lib/features/posts/presentation/providers/posts_list_controller.dart)

### 4. repository가 model을 entity로 바꾼다

- datasource는 API 응답을 `model`로 만들고,
- repository는 이를 화면에서 쓰는 `entity`로 바꿉니다.
- 파일:
  [lib/features/posts/data/repositories/posts_repository_impl.dart](/Users/jerry/dev/flutter_project/riverpod3_starter/lib/features/posts/data/repositories/posts_repository_impl.dart)
  [lib/features/products/data/repositories/products_repository_impl.dart](/Users/jerry/dev/flutter_project/riverpod3_starter/lib/features/products/data/repositories/products_repository_impl.dart)

### 4-1. posts도 usecase 계층을 통해 액션을 고정한다

- `posts`는 목록 조회, 상세 조회, 생성, 수정, 삭제를 `domain/usecases`에 둡니다.
- presentation/provider는 repository 구현 세부사항 대신 usecase를 통해 액션을 수행합니다.

### 5. datasource가 실제 HTTP 호출을 한다

- `/auth/login`, `/auth/me`, `/auth/refresh`
- `/products`, `/products/{id}`, `/products/search`, `/products/category/{slug}`
- `/posts`, `/posts/{id}`, `/posts/add`, `/posts/{id}` `PUT`, `/posts/{id}` `DELETE`
- 파일:
  [lib/features/auth/data/datasources/remote/dio_auth_remote_data_source.dart](/Users/jerry/dev/flutter_project/riverpod3_starter/lib/features/auth/data/datasources/remote/dio_auth_remote_data_source.dart)
  [lib/features/products/data/datasources/remote/dio_products_remote_data_source.dart](/Users/jerry/dev/flutter_project/riverpod3_starter/lib/features/products/data/datasources/remote/dio_products_remote_data_source.dart)
  [lib/features/posts/data/datasources/remote/dio_posts_remote_data_source.dart](/Users/jerry/dev/flutter_project/riverpod3_starter/lib/features/posts/data/datasources/remote/dio_posts_remote_data_source.dart)

### 6. apiClient가 Dio를 감싼다

- `ApiClient`는 `Dio`를 직접 페이지나 provider에서 쓰지 않도록 감싼 얇은 공통 레이어입니다.
- `getMap()`은 단건 조회
- `getList()`는 목록 조회
- `postMap()`, `putMap()`, `patchMap()`, `deleteMap()`은 생성/수정/삭제에 사용합니다.
- 파일:
  [lib/core/network/api_client.dart](/Users/jerry/dev/flutter_project/riverpod3_starter/lib/core/network/api_client.dart)

### 7. 공통 Dio가 인증 헤더와 로그를 처리한다

- `dioProvider`는 `DummyJSON` 공통 base URL을 사용합니다.
- 저장된 access token이 있으면 `Authorization` 헤더를 자동으로 붙입니다.
- 개발 모드에서는 `pretty_dio_logger`로 요청/응답이 출력됩니다.
- 파일:
  [lib/app/di/network_provider.dart](/Users/jerry/dev/flutter_project/riverpod3_starter/lib/app/di/network_provider.dart)

## 한 줄로 요약한 API 흐름

`화면 -> provider/controller -> repository -> datasource -> apiClient(Dio) -> 외부 API`

## 현재 API 구성

- `auth`는 `https://dummyjson.com/auth`
- `products`는 `https://dummyjson.com/products`
- `posts`는 `https://dummyjson.com/posts`
- 세 feature 모두 공통 `dioProvider`와 `ApiClient`를 사용합니다.
- 상품 카테고리 목록은 `https://dummyjson.com/products/category-list`를 사용합니다.
- 외부 네트워크 요청이 실제로 나갑니다.

`AppEnv.apiMode`를 `mock`으로 바꾸면 `auth`, `products`, `posts`는 각 feature의 mock remote datasource를 사용합니다.

## 로그 확인 방법

개발 모드에서는 공통 Dio에 `pretty_dio_logger`가 붙어 있습니다.

따라서 `flutter run`으로 실행한 뒤 로그인, 상품, 게시글 예제를 열면 요청/응답 정보가 터미널에 출력됩니다.

확인 포인트:

- 요청 URL
- query parameter
- 응답 body
- 에러 응답

## Flutter 초심자가 헷갈리기 쉬운 포인트

### 왜 page에서 Dio를 바로 안 쓰나요?

UI와 네트워크 코드를 분리하기 위해서입니다.  
화면은 "무엇을 보여줄지"만 알고, HTTP 구현은 repository/datasource가 맡습니다.

### 왜 provider가 여러 종류인가요?

- 읽기 전용 비동기 조회: `Future` 계열 provider
- 사용자 액션으로 상태가 바뀌는 비동기 상태: `AsyncNotifier`
- 폼/필터처럼 가벼운 동기 상태: `Notifier`

### `build_runner`는 왜 필요한가요?

이 프로젝트는 아래 생성 코드를 사용합니다.

- Riverpod generator
- Freezed
- `json_serializable`

그래서 코드를 수정한 뒤 생성 파일이 필요하면 아래 명령을 다시 실행해야 합니다.

```bash
dart run build_runner build -d
```

## 테스트

기본 검증:

```bash
flutter test
```

iOS 시뮬레이터 통합 테스트:

```bash
flutter test integration_test/app_smoke_test.dart -d <ios-simulator-id>
```

현재 통합 테스트는 아래 흐름을 검증합니다.

- 로그인
- 상품 목록/상세
- 프로필
- 게시글 목록/상세
- 로그아웃

## Makefile

```bash
make get
make build
make analyze
make test
```
