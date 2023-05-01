module Test.Generated.Main exposing (main)

import DayViewTests
import MainTests
import VerifyExamples.Model.WeatherData.ToHourlyDataPoints0
import VerifyExamples.Model.WeatherItems.AllSelected0
import VerifyExamples.Model.WeatherItems.AllSelected1
import VerifyExamples.Model.WeatherItems.IsItemSelected0
import VerifyExamples.Model.WeatherItems.Set0
import VerifyExamples.Model.WeatherItems.Set1
import VerifyExamples.Util.GroupBy0
import VerifyExamples.Util.GroupBy1
import VerifyExamples.Util.GroupBy2
import VerifyExamples.Util.MaximumBy0
import VerifyExamples.Util.MaximumBy1
import VerifyExamples.Util.MaximumBy2
import VerifyExamples.Util.MaybeToList0
import VerifyExamples.Util.MaybeToList1
import VerifyExamples.Util.MinimumBy0
import VerifyExamples.Util.MinimumBy1
import VerifyExamples.Util.MinimumBy2
import VerifyExamples.Util.ZipFilter0
import VerifyExamples.Util.ZipFilter1
import VerifyExamples.Util.ZipFilter2
import WeatherDataTests
import WeatherItemsViewTests
import WeekViewTests

import Test.Reporter.Reporter exposing (Report(..))
import Console.Text exposing (UseColor(..))
import Test.Runner.Node
import Test

main : Test.Runner.Node.TestProgram
main =
    Test.Runner.Node.run
        { runs = 100
        , report = JsonReport
        , seed = 376158560164992
        , processes = 2
        , globs =
            []
        , paths =
            [ "/home/daddy/Desktop/PF/Proiect Simina/Elm-Project(1)/tests/DayViewTests.elm"
            , "/home/daddy/Desktop/PF/Proiect Simina/Elm-Project(1)/tests/MainTests.elm"
            , "/home/daddy/Desktop/PF/Proiect Simina/Elm-Project(1)/tests/VerifyExamples/Model/WeatherData/ToHourlyDataPoints0.elm"
            , "/home/daddy/Desktop/PF/Proiect Simina/Elm-Project(1)/tests/VerifyExamples/Model/WeatherItems/AllSelected0.elm"
            , "/home/daddy/Desktop/PF/Proiect Simina/Elm-Project(1)/tests/VerifyExamples/Model/WeatherItems/AllSelected1.elm"
            , "/home/daddy/Desktop/PF/Proiect Simina/Elm-Project(1)/tests/VerifyExamples/Model/WeatherItems/IsItemSelected0.elm"
            , "/home/daddy/Desktop/PF/Proiect Simina/Elm-Project(1)/tests/VerifyExamples/Model/WeatherItems/Set0.elm"
            , "/home/daddy/Desktop/PF/Proiect Simina/Elm-Project(1)/tests/VerifyExamples/Model/WeatherItems/Set1.elm"
            , "/home/daddy/Desktop/PF/Proiect Simina/Elm-Project(1)/tests/VerifyExamples/Util/GroupBy0.elm"
            , "/home/daddy/Desktop/PF/Proiect Simina/Elm-Project(1)/tests/VerifyExamples/Util/GroupBy1.elm"
            , "/home/daddy/Desktop/PF/Proiect Simina/Elm-Project(1)/tests/VerifyExamples/Util/GroupBy2.elm"
            , "/home/daddy/Desktop/PF/Proiect Simina/Elm-Project(1)/tests/VerifyExamples/Util/MaximumBy0.elm"
            , "/home/daddy/Desktop/PF/Proiect Simina/Elm-Project(1)/tests/VerifyExamples/Util/MaximumBy1.elm"
            , "/home/daddy/Desktop/PF/Proiect Simina/Elm-Project(1)/tests/VerifyExamples/Util/MaximumBy2.elm"
            , "/home/daddy/Desktop/PF/Proiect Simina/Elm-Project(1)/tests/VerifyExamples/Util/MaybeToList0.elm"
            , "/home/daddy/Desktop/PF/Proiect Simina/Elm-Project(1)/tests/VerifyExamples/Util/MaybeToList1.elm"
            , "/home/daddy/Desktop/PF/Proiect Simina/Elm-Project(1)/tests/VerifyExamples/Util/MinimumBy0.elm"
            , "/home/daddy/Desktop/PF/Proiect Simina/Elm-Project(1)/tests/VerifyExamples/Util/MinimumBy1.elm"
            , "/home/daddy/Desktop/PF/Proiect Simina/Elm-Project(1)/tests/VerifyExamples/Util/MinimumBy2.elm"
            , "/home/daddy/Desktop/PF/Proiect Simina/Elm-Project(1)/tests/VerifyExamples/Util/ZipFilter0.elm"
            , "/home/daddy/Desktop/PF/Proiect Simina/Elm-Project(1)/tests/VerifyExamples/Util/ZipFilter1.elm"
            , "/home/daddy/Desktop/PF/Proiect Simina/Elm-Project(1)/tests/VerifyExamples/Util/ZipFilter2.elm"
            , "/home/daddy/Desktop/PF/Proiect Simina/Elm-Project(1)/tests/WeatherDataTests.elm"
            , "/home/daddy/Desktop/PF/Proiect Simina/Elm-Project(1)/tests/WeatherItemsViewTests.elm"
            , "/home/daddy/Desktop/PF/Proiect Simina/Elm-Project(1)/tests/WeekViewTests.elm"
            ]
        }
        [ ( "DayViewTests"
          , [ Test.Runner.Node.check DayViewTests.suite
            ]
          )
        , ( "MainTests"
          , [ Test.Runner.Node.check MainTests.weatherItemFuzzer
            , Test.Runner.Node.check MainTests.suite
            ]
          )
        , ( "VerifyExamples.Model.WeatherData.ToHourlyDataPoints0"
          , [ Test.Runner.Node.check VerifyExamples.Model.WeatherData.ToHourlyDataPoints0.weatherData
            , Test.Runner.Node.check VerifyExamples.Model.WeatherData.ToHourlyDataPoints0.hourlyData
            , Test.Runner.Node.check VerifyExamples.Model.WeatherData.ToHourlyDataPoints0.spec0
            ]
          )
        , ( "VerifyExamples.Model.WeatherItems.AllSelected0"
          , [ Test.Runner.Node.check VerifyExamples.Model.WeatherItems.AllSelected0.spec0
            ]
          )
        , ( "VerifyExamples.Model.WeatherItems.AllSelected1"
          , [ Test.Runner.Node.check VerifyExamples.Model.WeatherItems.AllSelected1.spec1
            ]
          )
        , ( "VerifyExamples.Model.WeatherItems.IsItemSelected0"
          , [ Test.Runner.Node.check VerifyExamples.Model.WeatherItems.IsItemSelected0.spec0
            ]
          )
        , ( "VerifyExamples.Model.WeatherItems.Set0"
          , [ Test.Runner.Node.check VerifyExamples.Model.WeatherItems.Set0.spec0
            ]
          )
        , ( "VerifyExamples.Model.WeatherItems.Set1"
          , [ Test.Runner.Node.check VerifyExamples.Model.WeatherItems.Set1.spec1
            ]
          )
        , ( "VerifyExamples.Util.GroupBy0"
          , [ Test.Runner.Node.check VerifyExamples.Util.GroupBy0.spec0
            ]
          )
        , ( "VerifyExamples.Util.GroupBy1"
          , [ Test.Runner.Node.check VerifyExamples.Util.GroupBy1.spec1
            ]
          )
        , ( "VerifyExamples.Util.GroupBy2"
          , [ Test.Runner.Node.check VerifyExamples.Util.GroupBy2.spec2
            ]
          )
        , ( "VerifyExamples.Util.MaximumBy0"
          , [ Test.Runner.Node.check VerifyExamples.Util.MaximumBy0.spec0
            ]
          )
        , ( "VerifyExamples.Util.MaximumBy1"
          , [ Test.Runner.Node.check VerifyExamples.Util.MaximumBy1.spec1
            ]
          )
        , ( "VerifyExamples.Util.MaximumBy2"
          , [ Test.Runner.Node.check VerifyExamples.Util.MaximumBy2.spec2
            ]
          )
        , ( "VerifyExamples.Util.MaybeToList0"
          , [ Test.Runner.Node.check VerifyExamples.Util.MaybeToList0.spec0
            ]
          )
        , ( "VerifyExamples.Util.MaybeToList1"
          , [ Test.Runner.Node.check VerifyExamples.Util.MaybeToList1.spec1
            ]
          )
        , ( "VerifyExamples.Util.MinimumBy0"
          , [ Test.Runner.Node.check VerifyExamples.Util.MinimumBy0.spec0
            ]
          )
        , ( "VerifyExamples.Util.MinimumBy1"
          , [ Test.Runner.Node.check VerifyExamples.Util.MinimumBy1.spec1
            ]
          )
        , ( "VerifyExamples.Util.MinimumBy2"
          , [ Test.Runner.Node.check VerifyExamples.Util.MinimumBy2.spec2
            ]
          )
        , ( "VerifyExamples.Util.ZipFilter0"
          , [ Test.Runner.Node.check VerifyExamples.Util.ZipFilter0.spec0
            ]
          )
        , ( "VerifyExamples.Util.ZipFilter1"
          , [ Test.Runner.Node.check VerifyExamples.Util.ZipFilter1.spec1
            ]
          )
        , ( "VerifyExamples.Util.ZipFilter2"
          , [ Test.Runner.Node.check VerifyExamples.Util.ZipFilter2.spec2
            ]
          )
        , ( "WeatherDataTests"
          , [ Test.Runner.Node.check WeatherDataTests.hourlyData
            , Test.Runner.Node.check WeatherDataTests.weatherData
            , Test.Runner.Node.check WeatherDataTests.suite
            ]
          )
        , ( "WeatherItemsViewTests"
          , [ Test.Runner.Node.check WeatherItemsViewTests.suite
            ]
          )
        , ( "WeekViewTests"
          , [ Test.Runner.Node.check WeekViewTests.suite
            ]
          )
        ]