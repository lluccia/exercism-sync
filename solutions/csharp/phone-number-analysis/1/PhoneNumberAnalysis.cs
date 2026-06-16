using System;

public static class PhoneNumber
{
    private const string NEW_YORK_DIALING_CODE = "212";
    private const string FAKE_PREFIX_CODE = "555";

    public static (bool IsNewYork, bool IsFake, string LocalNumber) Analyze(string phoneNumber)
    {
        string[] phoneParts = phoneNumber.Split("-");
        
        string dialingCode = phoneParts[0];
        string prefixCode = phoneParts[1];
        string localNumber = phoneParts[2];
        
        return (String.Equals(dialingCode, NEW_YORK_DIALING_CODE),
                String.Equals(prefixCode, FAKE_PREFIX_CODE),
                localNumber); 
    }

    public static bool IsFake((bool IsNewYork, bool IsFake, string LocalNumber) phoneNumberInfo)
    {
        return phoneNumberInfo.IsFake;
    }
}
