
import  {useQuery} from "@vue/apollo-composable"

const defaultClientId = "user";
const defaultEnabled = ref(true);
export default function (
  query,
  id,
  enabled = defaultEnabled,
  clientId = defaultClientId
) {
  console.log(enabled.value);
  console.log(clientId);
  const { onResult, loading, onError, refetch } = useQuery(
    query,
    () => ({
      id: id.value,
    }),

    () => ({
      fetchPolicy: "network-only",
      context: {
        headers: {
          "x-hasura-admin-secret": "YJH4s7x9412ZUUDSFd5MiBOsuySqYnokDj5fPhV04qcpTm8YeGjV2Wbp7wg4yUEQ"

        },
      },
      // debounce: "2000",
    })
  );

  return {
    onResult,
    loading,
    refetch,
    onError,
  };
}
