Imports System.Collections.Generic

Public Module MatchingBrackets
    Public Function IsPaired(ByVal input As String) As Boolean
        IsPaired = true

        Dim brackets As New Stack(Of Char)()

        For Each cc As Char In input
            Select Case cc
                Case "{"c
                    brackets.Push("}"c)
                Case "["c
                    brackets.Push("]"c)
                Case "("c
                    brackets.Push(")"c)
                Case "}"c, "]"c, ")"c
                    If brackets.Count = 0
                        IsPaired = false
                    Else
                        Dim prev as Char
                        prev = brackets.Pop()
                        If prev <> cc 
                            IsPaired = false
                        End If
                    End If
            End Select
        Next

        If brackets.Count = 0
            IsPaired = IsPaired and true
        Else
            IsPaired = false
        End If

    End Function
End Module
