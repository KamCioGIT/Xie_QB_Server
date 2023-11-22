import {
  ActionIcon,
  Button,
  Group,
  NumberInput,
  Paper,
  Stack,
  Title,
  Text,
  Transition,
  Tooltip,
} from "@mantine/core";
import { useDisclosure, useWindowEvent } from "@mantine/hooks";
import {
  IconChevronUp,
  IconChevronDown,
  IconEraserOff,
} from "@tabler/icons-react";
import { useState } from "react";
import { RegisterNUIMessage, TriggerNUICallback } from "./utils";

const App = () => {
  const [callsigns, setCallsigns] = useState<number[]>([0, 0, 0]);
  const [opened, handlers] = useDisclosure(false);

  RegisterNUIMessage(
    "openCallsignMenu",
    (payload: { currentCallsign: number[] }) => {
      setCallsigns(payload.currentCallsign);

      handlers.open();
    }
  );

  useWindowEvent("keydown", (event) => {
    if (event.key == "Escape") {
      TriggerNUICallback("closeCallsignMenu");

      handlers.close();
    }
  });

  return (
    <Transition transition="fade" duration={500} mounted={opened}>
      {(transitionStyles) => (
        <Paper
          shadow="md"
          p="md"
          radius="md"
          w="20vw"
          style={transitionStyles}
          sx={{
            position: "absolute",
            top: "50%",
            right: "0",
            transform: "translateY(-50%)",
          }}
          m="xl"
        >
          <Group position="apart">
            <Title order={2}>Callsigns</Title>

            <Tooltip label="Clear all callsigns" position="left">
              <ActionIcon
                size="2.4vh"
                radius="xl"
                onClick={() => {
                  setCallsigns([-1, -1, -1]);

                  TriggerNUICallback("clearCallsigns");
                }}
              >
                <IconEraserOff size="1.8vh" />
              </ActionIcon>
            </Tooltip>
          </Group>

          <Text size="sm" mt="xs">
            呼号用于识别，你可以最多创建3个呼号。
          </Text>

          <Stack align="center" mt="xl">
            <Group spacing="xl">
              <DigitSlider
                value={callsigns[0]}
                onChange={(value) => {
                  setCallsigns([value, callsigns[1], callsigns[2]]);

                  TriggerNUICallback("setCallsign", {
                    index: 8,
                    number: value,
                  });
                }}
              />

              <DigitSlider
                value={callsigns[1]}
                onChange={(value) => {
                  setCallsigns([callsigns[0], value, callsigns[2]]);

                  TriggerNUICallback("setCallsign", {
                    index: 9,
                    number: value,
                  });
                }}
              />

              <DigitSlider
                value={callsigns[2]}
                onChange={(value) => {
                  setCallsigns([callsigns[0], callsigns[1], value]);

                  TriggerNUICallback("setCallsign", {
                    index: 10,
                    number: value,
                  });
                }}
              />
            </Group>
          </Stack>

          <Group position="right" mt="xl">
            <Button
              variant="light"
              color="red"
              onClick={() => {
                TriggerNUICallback("closeCallsignMenu");

                handlers.close();
              }}
            >
              取消
            </Button>

            <Button
              variant="light"
              onClick={() => {
                TriggerNUICallback("saveCallsignMenu");

                handlers.close();
              }}
            >
              保存
            </Button>
          </Group>
        </Paper>
      )}
    </Transition>
  );
};

export default App;

const DigitSlider = ({
  value,
  onChange,
}: {
  value: number;
  onChange: (value: number) => void;
}) => {
  return (
    <Stack align="center" w="2vw" spacing="xs">
      <ActionIcon
        size="2.9vh"
        variant="default"
        onClick={() => {
          if (value >= 9) {
            onChange(0);
          } else {
            onChange(value + 1);
          }
        }}
      >
        <IconChevronUp size="2vh" />
      </ActionIcon>

      <NumberInput
        placeholder="3"
        hideControls={true}
        min={0}
        max={9}
        value={value}
        onChange={(value) => {
          if (value == "") value = 0;

          onChange(value);
        }}
      />

      <ActionIcon
        size="2.9vh"
        variant="default"
        onClick={() => {
          if (value <= 0) {
            onChange(9);
          } else {
            onChange(value - 1);
          }
        }}
      >
        <IconChevronDown size="2vh" />
      </ActionIcon>
    </Stack>
  );
};
