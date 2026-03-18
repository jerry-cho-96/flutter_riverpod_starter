enum AppFlavor { dev, staging, prod }

AppFlavor parseAppFlavor(String value) {
  return switch (value.toLowerCase()) {
    'staging' => AppFlavor.staging,
    'prod' => AppFlavor.prod,
    _ => AppFlavor.dev,
  };
}
