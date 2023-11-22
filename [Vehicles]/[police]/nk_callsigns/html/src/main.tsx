import ReactDOM from "react-dom/client";
import App from "./App.tsx";
import "./index.css";
import { MantineProvider } from "@mantine/core";

ReactDOM.createRoot(document.getElementById("root") as HTMLElement).render(
  <MantineProvider
    withGlobalStyles
    withNormalizeCSS
    withCSSVariables
    theme={{
      fontFamily: "Montserrat",
      colorScheme: "dark",
      focusRing: "never",

      components: {
        NumberInput: {
          defaultProps: {
            size: "custom",
          },
          sizes: {
            custom: () => ({
              input: {
                height: "2.9vh",
                width: "2.9vh",
                textAlign: "center",
              },
            }),
          },
        },

        Button: {
          defaultProps: {
            size: "custom",
          },
          sizes: {
            custom: (theme) => ({
              root: {
                padding: theme.spacing.xs,
              },
            }),
          },
        },
      },

      fontSizes: {
        xs: "1.111111111111111vh",
        sm: "1.2962962962962963vh",
        md: "1.4814814814814814vh",
        lg: "1.6666666666666665vh",
        xl: "1.8518518518518516vh",
      },
      radius: {
        xs: "0.18518518518518517vh",
        sm: "0.37037037037037035vh",
        md: "0.7407407407407407vh",
        lg: "1.4814814814814814vh",
        xl: "2.962962962962963vh",
      },
      spacing: {
        xs: "0.9259259259259258vh",
        sm: "1.111111111111111vh",
        md: "1.4814814814814814vh",
        lg: "1.8518518518518516vh",
        xl: "2.222222222222222vh",
      },
      shadows: {
        xs: "0 0 0 1px rgba(0, 0, 0, 0.1)",
        sm: "0 1px 2px rgba(0, 0, 0, 0.1)",
        md: "0 2px 4px rgba(0, 0, 0, 0.1)",
        lg: "0 4px 8px rgba(0, 0, 0, 0.1)",
        xl: "0 8px 16px rgba(0, 0, 0, 0.1)",
      },
      headings: {
        sizes: {
          h1: { fontSize: "2.962962962962963vh", lineHeight: 1 },
          h2: { fontSize: "2.222222222222222vh", lineHeight: 1 },
          h3: { fontSize: "1.8518518518518516vh", lineHeight: 1 },
          h4: { fontSize: "1.4814814814814814vh", lineHeight: 1 },
          h5: { fontSize: "1.111111111111111vh", lineHeight: 1 },
          h6: { fontSize: "0.9259259259259258vh", lineHeight: 1 },
        },
      },
    }}
  >
    <App />
  </MantineProvider>
);
