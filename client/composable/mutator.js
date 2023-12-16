import { useMutation } from "@vue/apollo-composable";

export default function (query, clientId) {
  const { mutate, onDone, loading, onError } = useMutation(query, () => ({
    fetchPolicy: "network-only",
    context: {
      headers: {
        "x-hasura-admin-secret":
          "JRH60X2YB8srVXuiNYtNKvClhV6vYoVQtbG7aasuCOYGU34VhZtSOQtEM3Aalx42",
      },
    },
  }));
  // onError((err) => notify(parse(err)));

  return {
    mutate,
    loading,
    onDone,
    onError,
  };
}
