-----------------------------------------------------------------------------
-- |
-- License     :  BSD-3-Clause
--
module GitHub.Data.Reactions where

import GitHub.Data.URL         (URL)
import GitHub.Internal.Prelude
import Prelude ()

data Reactions = Reactions
    { reactionsUrl      :: !(Maybe URL)
    , reactionsCount    :: !(Maybe Int)
    , reactionsPlus1    :: !(Maybe Int)
    , reactionsMinus1   :: !(Maybe Int)
    , reactionsLaugh    :: !(Maybe Int)
    , reactionsHooray   :: !(Maybe Int)
    , reactionsConfused :: !(Maybe Int)
    , reactionsHeart    :: !(Maybe Int)
    , reactionsRocket   :: !(Maybe Int)
    , reactionsEyes     :: !(Maybe Int)
    }
  deriving (Show, Data, Typeable, Eq, Ord, Generic)

instance FromJSON Reactions where
    parseJSON = withObject "Reactions" $ \o -> Reactions
        <$> o .:? "url"
        <*> o .:? "total_count"
        <*> o .:? "+1"
        <*> o .:? "-1"
        <*> o .:? "laugh"
        <*> o .:? "hooray"
        <*> o .:? "confused"
        <*> o .:? "heart"
        <*> o .:? "rocket"
        <*> o .:? "eyes"

instance NFData Reactions where rnf = genericRnf
instance Binary Reactions
