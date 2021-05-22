import React from "react";
import ReactDOM from "react-dom";
import {
  AdaptivityProvider,
  ConfigProvider,
  useAdaptivity,
  AppRoot,
  SplitLayout,
  SplitCol,
  ViewWidth,
  View,
  Panel,
  PanelHeader,
  Header,
  Group,
  SimpleCell,
  Div,
} from "@vkontakte/vkui";
import "@vkontakte/vkui/dist/vkui.css";

const Example = () => {
  const { viewWidth } = useAdaptivity();

  return (
    <AppRoot>
      <SplitLayout header={<PanelHeader separator={false} />}>
        <SplitCol spaced={viewWidth > ViewWidth.MOBILE}>
          <View activePanel="main">
            <Panel id="main">
              <PanelHeader>Наша команда</PanelHeader>
              <Group header={<Header mode="primary">Кореньков Владислав</Header>}>
                <Div style={{ paddingTop: 0, paddingBottom: 10, color: '#4a4a4a' }}>
                  Владислав - умный парень, любит программирование и математическую логику! Сладкий мальчик.
                </Div>
              </Group>
              <Group header={<Header mode="primary">Смирнов Иван</Header>}>
                <Div style={{ paddingTop: 0, paddingBottom: 10, color: '#4a4a4a' }}>
                  Иван любит урбанистику и комфортные города, поэтому он очень ругает мэрию Владивостока за то, что город очень неудобен для пешеходов и маломобильного слоя населения.
                </Div>
              </Group>
              <Group header={<Header mode="primary">Изотов Данил</Header>}>
                <Div style={{ paddingTop: 0, paddingBottom: 10, color: '#4a4a4a' }}>
                  Данил - самый умный в нашей команде! Он сдал ЕГЭ по математике на 96 баллов! А еще он не учит доказательства, а выводит их прямо на экзамене.
                </Div>
              </Group>
              <Group header={<Header mode="primary">Ильченко Александр</Header>}>
                <Div style={{ paddingTop: 0, paddingBottom: 10, color: '#4a4a4a' }}>
                  Александр - бог фотошопа и видеомонтажа. Ведёт свой паблик во вконтакте, где делает смешные мемы.
                </Div>
              </Group>

            </Panel>
          </View>
        </SplitCol>
      </SplitLayout>
    </AppRoot >
  );
};

ReactDOM.render(
  <ConfigProvider>
    <AdaptivityProvider>
      <Example />
    </AdaptivityProvider>
  </ConfigProvider>,
  document.getElementById("root")
);